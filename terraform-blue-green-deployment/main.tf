data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_security_group" "web_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "blue" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  count         = var.active_color == "blue" ? 1 : 0

  user_data = <<EOF
#!/bin/bash
echo "BLUE VERSION" > /var/www/html/index.html
yum install -y httpd
systemctl start httpd
EOF

  tags = { Name = "blue-instance" }
}

resource "aws_instance" "green" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  count         = var.active_color == "green" ? 1 : 0

  user_data = <<EOF
#!/bin/bash
echo "GREEN VERSION" > /var/www/html/index.html
yum install -y httpd
systemctl start httpd
EOF

  tags = { Name = "green-instance" }
}

resource "aws_lb" "alb" {
  name               = "blue-green-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [aws_security_group.web_sg.id]
}

resource "aws_lb_target_group" "blue" {
  name     = "blue-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "green" {
  name     = "green-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.active_color == "blue" ? aws_lb_target_group.blue.arn : aws_lb_target_group.green.arn
  }
}


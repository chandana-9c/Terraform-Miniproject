data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

locals {
  env = terraform.workspace

  instance_name = "${local.env}-ec2"

  instance_count = local.env == "prod" ? 1 : 1
}

resource "aws_instance" "this" {
  count         = local.instance_count
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  tags = {
    Name = local.instance_name
    Env  = local.env
  }
}



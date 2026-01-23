terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.2.0"
}

# Create and manage an EC2 instance in AWS with these settings.
resource "aws_instance" "app_server" {
  ami           = "ami-093467ec28ae4fe03"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform_Demo_Ec2"
  }
}

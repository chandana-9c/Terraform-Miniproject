# create and manage s3 bucket

resource "aws_s3_bucket" "my_bucket" { 
  bucket = "my-terraform-bucket-chandana001"

  tags = {
    Name = "Terraform_Demo"
  }
}


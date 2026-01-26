terraform { 
  backend "s3" {
    bucket = "s3bucketchandana0001"  # your bucket name
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}


resource "aws_s3_bucket" "cicd_demo" {
  bucket = "terraform-cicd-demo-123456"
  force_destroy = true
}


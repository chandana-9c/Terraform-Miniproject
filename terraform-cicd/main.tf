# to store statefile os S3 bucket that we will be creating
terraform { 
  backend "s3" {
    bucket = "s3bucketchandana0001"  # your bucket name
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# resouce/bucket to be created
resource "aws_s3_bucket" "cicd_demo" {
  bucket = "terraform-cicd-demo-123456-8"
  force_destroy = true
}





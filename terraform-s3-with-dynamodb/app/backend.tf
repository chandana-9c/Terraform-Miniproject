terraform {
  backend "s3" {
    bucket         = "terraform-state-backend-123456"
    key            = "app/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}


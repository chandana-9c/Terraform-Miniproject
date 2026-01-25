resource "aws_s3_bucket" "cicd_demo" {
  bucket = "terraform-cicd-demo-123456-8"
  force_destroy = true
}





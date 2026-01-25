output "test_bucket_name" {
  description = "S3 bucket created to test remote backend"
  value       = aws_s3_bucket.example.bucket
}

output "remote_state_backend" {
  description = "Remote backend S3 location"
  value       = "s3://terraform-state-backend-123456/app/terraform.tfstate"
}


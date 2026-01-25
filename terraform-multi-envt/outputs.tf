output "environment" {
  value = terraform.workspace
}

output "instance_ids" {
  value = aws_instance.this[*].id
}


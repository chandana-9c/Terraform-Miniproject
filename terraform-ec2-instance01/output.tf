output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
#  sensitive = true
}


output "ec2_private_ip" {
  value = aws_instance.app_server.private_ip
  sensitive = true
}

output "ec2_public_dns" {
  value = aws_instance.app_server.public_dns
}

output "instance_id" {
  value = aws_instance.app_server.id
}

output "availability_zone" {
  value = aws_instance.app_server.availability_zone
}

output "instance_type" {
  value = aws_instance.app_server.instance_type
}


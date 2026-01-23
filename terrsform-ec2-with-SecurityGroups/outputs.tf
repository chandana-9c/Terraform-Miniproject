output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.ec2.public_ip
  sensitive = true
}

output "ssh_command" {
#  value = "ssh -i <your-key.pem> ec2-user@${aws_instance.ec2.public_ip}"
  value = "ssh -i /Users/cc29/Downloads/KeyShellscriptGit.pem ubuntu@${aws_instance.ec2.public_ip}"
  sensitive = true
}


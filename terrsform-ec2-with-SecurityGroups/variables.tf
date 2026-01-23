# region
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}


variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

#variable "key_name" {
#  description = "EC2 Key Pair name (must exist in AWS)"
#}

variable "ssh_cidr" {
  description = "CIDR block allowed for SSH"
  default     = "0.0.0.0/0" # ⚠️Change to your IP for security
}


variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-2"
}

variable "enable_public_access" {
  description = "Allow public access (true/false)"
  type        = bool
  default     = false
}


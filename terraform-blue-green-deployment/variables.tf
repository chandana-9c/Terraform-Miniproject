variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "active_color" {
  description = "Which environment is live: blue or green"
  type        = string
  default     = "blue"
}


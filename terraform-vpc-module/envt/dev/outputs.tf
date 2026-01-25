output "dev_vpc_id" {
  description = "VPC ID from reusable module"
  value       = module.vpc.vpc_id
}

output "dev_vpc_cidr" {
  description = "VPC CIDR from reusable module"
  value       = module.vpc.vpc_cidr
}

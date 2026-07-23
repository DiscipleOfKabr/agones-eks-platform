output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets for EKS worker nodes"
  value       = module.network.private_subnet_ids
}


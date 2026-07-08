variable "env_name" {
  type        = string
  description = "The name of the environment (e.g., dev, prod)"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs where EKS control plane ENIs and worker nodes will be deployed"
}
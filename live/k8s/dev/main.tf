data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    
    bucket = "agones-project-bckt" 
    key    = "infra/dev/terraform.tfstate" 
    region = "eu-central-1"
  }
}

resource "aws_eks_cluster" "this" {
  name     = "${var.env_name}-cluster"
  role_arn = aws_iam_role.cluster.arn
  version  = "1.30"

  vpc_config {
    subnet_ids              = data.terraform_remote_state.network.outputs.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy
  ]
}
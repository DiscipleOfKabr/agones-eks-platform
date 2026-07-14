# EKS Managed Node Group (The Collective Worker Nodes)
resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.env_name}-worker-nodes"
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = data.terraform_remote_state.network.outputs.private_subnet_ids

  # Instance sizing configuration for a performant dev environment
  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly,
  ]
}
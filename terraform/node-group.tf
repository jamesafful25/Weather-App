
# ==========================================
# 1. EKS Managed Node Group
# ==========================================

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${local.name}-workers"
  node_role_arn   = aws_iam_role.eks_node.arn

  subnet_ids = aws_subnet.public[*].id

  # EC2 instance configuration
  instance_types = ["t3.medium"]

  # Worker node scaling
  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }

  # Update configuration
  update_config {
    max_unavailable = 1
  }

  # Ensure IAM policies are attached before creating workers
  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_ecr_readonly_policy
  ]

  tags = local.common_tags
}

# ==========================================
# 1. EKS Cluster
# ==========================================

resource "aws_eks_cluster" "main" {
  name     = "${local.name}-eks"
  role_arn = aws_iam_role.eks_cluster.arn
  version  = "1.37"

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = false
  }

  vpc_config {
    subnet_ids              = aws_subnet.public[*].id
    endpoint_private_access = true
    endpoint_public_access  = true

    public_access_cidrs = [
      "0.0.0.0/0"
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]

  tags = local.common_tags
}


# ==========================================
# 2. EKS Access Entry for Terraform Admin
# ==========================================

resource "aws_eks_access_entry" "terraform_admin" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = "arn:aws:iam::448161422880:user/terraform_admin"
  type          = "STANDARD"
}

# ==========================================
# 3. Grant View-Only Kubernetes Access
# ==========================================

resource "aws_eks_access_policy_association" "terraform_admin_view" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = aws_eks_access_entry.terraform_admin.principal_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"

  access_scope {
    type = "cluster"
  }
}

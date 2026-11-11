# ==========================================
# 1. AWS Account Information
# ==========================================

output "aws_account_id" {
  description = "AWS account ID"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "AWS deployment region"
  value       = var.aws_region
}


# ==========================================
# 2. ECR Repository Information
# ==========================================

output "ecr_repository_name" {
  description = "Weather App ECR repository name"
  value       = aws_ecr_repository.weather_app.name
}

output "ecr_repository_url" {
  description = "Weather App ECR repository URL"
  value       = aws_ecr_repository.weather_app.repository_url
}


# ==========================================
# 3. Networking Information
# ==========================================

output "vpc_id" {
  description = "Weather App VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}


# ==========================================
# 4. EKS Cluster Information
# ==========================================

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.main.name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "eks_cluster_version" {
  description = "EKS Kubernetes version"
  value       = aws_eks_cluster.main.version
}

output "eks_cluster_security_group_id" {
  description = "EKS cluster security group ID"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}


# ==========================================
# 5. EKS Worker Node Information
# ==========================================

output "eks_node_group_name" {
  description = "EKS managed node group name"
  value       = aws_eks_node_group.main.node_group_name
}


# ==========================================
# 6. GitHub Actions IAM Information
# ==========================================

output "github_actions_role_arn" {
  description = "IAM role ARN used by GitHub Actions"
  value       = aws_iam_role.github_actions.arn
}


# ==========================================
# 7. AWS Load Balancer Controller IAM
# ==========================================

output "alb_controller_role_arn" {
  description = "IAM role ARN for AWS Load Balancer Controller"
  value       = aws_iam_role.alb_controller.arn
}

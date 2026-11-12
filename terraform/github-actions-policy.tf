
# ==========================================
# 1. GitHub Actions ECR Permissions
# ==========================================

resource "aws_iam_policy" "github_actions_ecr" {
  name        = "${local.name}-github-actions-ecr-policy"
  description = "Allow GitHub Actions to push Weather App images to ECR"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "ECRAuthentication"
        Effect = "Allow"

        Action = [
          "ecr:GetAuthorizationToken"
        ]

        Resource = "*"
      },
      {
        Sid    = "PushImagesToWeatherAppRepository"
        Effect = "Allow"

        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage"
        ]
        Resource = aws_ecr_repository.weather_app.arn
      }
    ]
  })

  tags = local.common_tags
}

# ==========================================
# 2. Attach ECR Permissions to GitHub Role
# ==========================================

resource "aws_iam_role_policy_attachment" "github_actions_ecr" {
  role       = aws_iam_role.github_actions.name
  policy_arn = aws_iam_policy.github_actions_ecr.arn
}



# ==========================================
# 3. GitHub Actions EKS Access Entry
# ==========================================

resource "aws_eks_access_entry" "github_actions" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = aws_iam_role.github_actions.arn
  type          = "STANDARD"
}

# ==========================================
# 4. Grant Kubernetes Deployment Permissions
# ==========================================

resource "aws_eks_access_policy_association" "github_actions_admin" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = aws_eks_access_entry.github_actions.principal_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}

# ==========================================
# 5. Allow GitHub Actions to Describe EKS
# ==========================================

resource "aws_iam_role_policy" "github_actions_eks_describe" {
  name = "${local.name}-github-actions-eks-describe"
  role = aws_iam_role.github_actions.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Action = [
        "eks:DescribeCluster"
      ]

      Resource = aws_eks_cluster.main.arn
    }]
  })
}

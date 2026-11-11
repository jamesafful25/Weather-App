
# ==========================================
# 1. GitHub Actions IAM Role
# ==========================================

resource "aws_iam_role" "github_actions" {
  name = "${local.name}-github-actions-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Federated = "arn:aws:iam::448161422880:oidc-provider/token.actions.githubusercontent.com"
      }

      Action = "sts:AssumeRoleWithWebIdentity"

      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          "token.actions.githubusercontent.com:sub" = "repo:jamesafful25/Weather-App:ref:refs/heads/main"
        }
      }
    }]
  })

  tags = local.common_tags
}

# GitHub OIDC Provider for GitHub Actions (using existing provider)
data "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"
}

# IAM Role for GitHub Actions ECR Management
resource "aws_iam_role" "github_actions_ecr" {
  name = "github-actions-mews-ecr-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = data.aws_iam_openid_connect_provider.github.arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
        }
        StringLike = {
          "token.actions.githubusercontent.com:sub" = "repo:${var.github_repository}:*"
        }
      }
    }]
  })
  
  tags = {
    Name = "GitHub Actions Role for mews-ecr"
    Project = "mews-ecr"
  }
}

# Policy for GitHub Actions to manage ECR repositories
resource "aws_iam_role_policy" "github_actions_ecr_policy" {
  name = "github-actions-mews-ecr-policy"
  role = aws_iam_role.github_actions_ecr.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:*",
          "sts:GetCallerIdentity"
        ]
        Resource = "*"
      }
    ]
  })
}
# Output main ECR repository URLs
output "main_ecr_repositories" {
  value = {
    for repo_name, repo in aws_ecr_repository.mews_repos : repo_name => repo.repository_url
  }
  description = "URLs of main MEWS ECR repositories"
}

# GitHub Actions role ARN (managed centrally via github-oidc-terraform)
output "github_actions_role_arn" {
  value       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/mews-ecr-oidc-github-actions-role"
  description = "ARN of the GitHub Actions IAM role for ECR management (centrally managed)"
}

# AWS Account and Region information
output "aws_account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "AWS Account ID where ECR repositories are created"
}

output "aws_region" {
  value       = data.aws_region.current.name
  description = "AWS Region where ECR repositories are created"
}

# Note: stub_ecr_repositories output is defined in ecr-stubs.tf
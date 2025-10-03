# Output main ECR repository URLs (account ID masked for security)
output "main_ecr_repositories" {
  value = {
    for repo_name, repo in aws_ecr_repository.mews_repos : repo_name => replace(repo.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
  }
  description = "URLs of main MEWS ECR repositories (account ID masked)"
  sensitive = false
}

# GitHub Actions role ARN (managed centrally via github-oidc-terraform)
output "github_actions_role_arn" {
  value       = "arn:aws:iam::***MASKED***:role/mews-ecr-oidc-github-actions-role"
  description = "ARN of the GitHub Actions IAM role for ECR management (account ID masked)"
  sensitive   = false
}

# AWS Account and Region information (account ID masked for security)
output "aws_account_id" {
  value       = "***MASKED***"
  description = "AWS Account ID masked for security"
  sensitive   = false
}

output "aws_region" {
  value       = data.aws_region.current.name
  description = "AWS Region where ECR repositories are created"
}

# Note: stub_ecr_repositories output is defined in ecr-stubs.tf
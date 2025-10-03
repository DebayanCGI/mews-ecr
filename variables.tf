variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "aws_profile" {
  description = "AWS profile to use for local development (not used in GitHub Actions)"
  type        = string
  default     = null
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "github_repository" {
  description = "GitHub repository in format owner/repo for OIDC"
  type        = string
  default     = "DebayanCGI/mews-ecr"
}
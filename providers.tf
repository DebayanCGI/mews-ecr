terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "mews-terraform-state-dev"
    key            = "mews-ecr/dev/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "mews-terraform-state-lock"
    encrypt        = true
  }
}

# Data sources for dynamic account detection
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}
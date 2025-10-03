locals {
  ecr_repositories = ["mews-proxy", "mews-ws", "mews-es", "mysql57"]
}

resource "aws_ecr_repository" "mews_repos" {
  for_each             = toset(local.ecr_repositories)
  name                 = each.value
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment      = var.environment
    Project          = "MEWS"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_lifecycle_policy" "mews_repos_policy" {
  for_each   = aws_ecr_repository.mews_repos
  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 10 images"
        selection = {
          tagStatus     = "tagged"
          tagPrefixList = ["v"]
          countType     = "imageCountMoreThan"
          countNumber   = 10
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
# ECR repositories for all MEWS stubs

# Group 1 - all-stubs-1
resource "aws_ecr_repository" "mews_bolt_on_stub" {
  name                 = "mews-bolt-on-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-bolt-on-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_diameter_stack_stub" {
  name                 = "mews-diameter-stack-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-diameter-stack-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_esa_stub" {
  name                 = "mews-esa-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-esa-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_inventory_ms_stub" {
  name                 = "mews-inventory-ms-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-inventory-ms-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_jwe_utility_stub" {
  name                 = "mews-jwe-utility-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-jwe-utility-stub"
    CostCategoryTask = "uPair"
  }
}

# Group 2 - all-stubs-2
resource "aws_ecr_repository" "mews_license_generator_stub" {
  name                 = "mews-license-generator-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-license-generator-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_mediator_stub" {
  name                 = "mews-mediator-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-mediator-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_naas_stub" {
  name                 = "mews-naas-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-naas-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_notify_poc_stub" {
  name                 = "mews-notify-poc-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-notify-poc-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_notify_simulator_stub" {
  name                 = "mews-notify-simulator-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-notify-simulator-stub"
    CostCategoryTask = "uPair"
  }
}

# Group 3 - all-stubs-3
resource "aws_ecr_repository" "mews_order_submission_stub" {
  name                 = "mews-order-submission-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-order-submission-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_smdp_stub" {
  name                 = "mews-smdp-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-smdp-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_unms_stub" {
  name                 = "mews-unms-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-unms-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_wme_stub" {
  name                 = "mews-wme-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-wme-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_wtc_stub" {
  name                 = "mews-wtc-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-wtc-stub"
    CostCategoryTask = "uPair"
  }
}

resource "aws_ecr_repository" "mews_cbd_stub" {
  name                 = "mews-cbd-stub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "mews-cbd-stub"
    CostCategoryTask = "uPair"
  }
}

# Output all ECR repository URLs (account ID masked for security)
output "stub_ecr_repositories" {
  value = {
    bolt_on_stub           = replace(aws_ecr_repository.mews_bolt_on_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    cbd_stub              = replace(aws_ecr_repository.mews_cbd_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    diameter_stack_stub    = replace(aws_ecr_repository.mews_diameter_stack_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    esa_stub              = replace(aws_ecr_repository.mews_esa_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    inventory_ms_stub     = replace(aws_ecr_repository.mews_inventory_ms_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    jwe_utility_stub      = replace(aws_ecr_repository.mews_jwe_utility_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    license_generator_stub = replace(aws_ecr_repository.mews_license_generator_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    mediator_stub         = replace(aws_ecr_repository.mews_mediator_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    naas_stub             = replace(aws_ecr_repository.mews_naas_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    notify_poc_stub       = replace(aws_ecr_repository.mews_notify_poc_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    notify_simulator_stub = replace(aws_ecr_repository.mews_notify_simulator_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    order_submission_stub = replace(aws_ecr_repository.mews_order_submission_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    smdp_stub             = replace(aws_ecr_repository.mews_smdp_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    unms_stub             = replace(aws_ecr_repository.mews_unms_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    wme_stub              = replace(aws_ecr_repository.mews_wme_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
    wtc_stub              = replace(aws_ecr_repository.mews_wtc_stub.repository_url, data.aws_caller_identity.current.account_id, "***MASKED***")
  }
  description = "URLs of stub ECR repositories (account ID masked)"
  sensitive   = false
}

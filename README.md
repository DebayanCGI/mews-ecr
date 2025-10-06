# MEWS ECR Repository Management

This repository manages Amazon Elastic Container Registry (ECR) repositories for the MEWS application stack using Terraform and GitHub Actions.

## Architecture Overview

This project creates and manages the following ECR repositories:

### Main Application Repositories (4)
- `mews-proxy` - Application proxy service
- `mews-ws` - Web service component  
- `mews-es` - Elasticsearch service
- `mysql57` - MySQL 5.7 database

### Stub Application Repositories (15)
- `mews-bolt-on-stub`
- `mews-diameter-stack-stub`
- `mews-esa-stub`
- `mews-inventory-ms-stub`
- `mews-jwe-utility-stub`
- `mews-license-generator-stub`
- `mews-mediator-stub`
- `mews-naas-stub`
- `mews-notify-poc-stub`
- `mews-notify-simulator-stub`
- `mews-order-submission-stub`
- `mews-smdp-stub`
- `mews-unms-stub`
- `mews-wme-stub`
- `mews-wtc-stub`

Each repository includes:
- Lifecycle policies for image cleanup (keeps last 10 images)
- Image scanning enabled on push
- Proper tagging and mutable tags for development flexibility

## Prerequisites

- AWS Account with appropriate permissions
- GitHub repository with OIDC provider configured
- Terraform >= 1.0

## Repository Structure

```
mews-ecr/
├── ecr.tf                    # ECR repository definitions
├── ecr-stubs.tf             # Stub ECR configurations
├── github-oidc-setup.tf     # GitHub Actions OIDC role
├── providers.tf             # Terraform providers and backend
├── variables.tf             # Input variables
├── outputs.tf               # Output values
├── terraform.tfvars.dev     # Development configuration
├── .github/
│   └── workflows/
│       └── deploy-ecr.yml   # GitHub Actions deployment
└── README.md               # This file
```

## Configuration

### Environment Variables

The following variables can be configured in `terraform.tfvars.dev`:

```hcl
aws_profile = "cgi-telstra"           # AWS CLI profile
environment = "dev"                   # Environment name
github_repository = "your-repo-name"  # GitHub repository name
```

### AWS Profile Setup

Ensure your AWS profile is configured:
```bash
aws configure --profile cgi-telstra
```

### GitHub Secrets Configuration

Before deploying via GitHub Actions, you need to configure the following repository secret:

| Secret Name | Value | Description |
|-------------|-------|-------------|
| `AWS_ROLE_ARN` | `arn:aws:iam::***ACCOUNT-ID***:role/mews-ecr-oidc-github-actions-role` | OIDC role ARN for GitHub Actions |

To add this secret:
1. Go to your GitHub repository
2. Navigate to Settings → Secrets and variables → Actions
3. Click "New repository secret"
4. Add the secret name and value as shown above

## Deployment

### GitHub Actions (Recommended)

The repository includes automated deployment via GitHub Actions with three workflows:

1. **Plan** - Shows what changes will be made
2. **Apply** - Applies the Terraform configuration
3. **Destroy** - Destroys the infrastructure

#### Workflow Triggers

- **Plan**: Runs on pull requests and manual trigger
- **Apply**: Manual trigger only (requires approval)
- **Destroy**: Manual trigger only (requires approval)

#### Running Workflows

1. Go to your GitHub repository
2. Click on the "Actions" tab
3. Select the desired workflow
4. Click "Run workflow"
5. Choose the environment (dev, staging, prod)

### Local Deployment

If you need to run Terraform locally:

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan -var-file="terraform.tfvars.dev"

# Apply the configuration
terraform apply -var-file="terraform.tfvars.dev"

# Destroy when needed
terraform destroy -var-file="terraform.tfvars.dev"
```

## State Management

This project uses remote state management with:
- **S3 Backend**: Stores Terraform state in AWS S3
- **DynamoDB Locking**: Prevents concurrent modifications
- **State Encryption**: All state data is encrypted at rest

The state configuration is defined in `providers.tf` and automatically uses your AWS account ID.

## Security Features

### OIDC Authentication
- Uses GitHub OIDC provider for passwordless authentication
- Eliminates need for long-lived AWS credentials
- Scoped IAM permissions for ECR management only

### Repository Security
- Image scanning enabled by default
- Lifecycle policies prevent repository bloat
- Proper tagging for resource management

## Outputs

After deployment, the following outputs are available:

- `ecr_repository_urls` - URLs of all created ECR repositories
- `github_actions_role_arn` - ARN of the GitHub Actions IAM role
- `aws_account_id` - AWS account ID used for deployment

## Troubleshooting

### Common Issues

1. **Authentication Errors**
   - Ensure AWS profile is configured correctly
   - Verify OIDC provider trust relationship
   - Check that `AWS_ROLE_ARN` secret is configured in GitHub repository

2. **State Lock Issues**
   - Wait for concurrent operations to complete
   - Use `terraform force-unlock` if needed (with caution)

3. **Permission Errors**
   - Verify IAM permissions for ECR operations
   - Check GitHub Actions role permissions

### Useful Commands

```bash
# Check AWS authentication
aws sts get-caller-identity --profile cgi-telstra

# Validate Terraform configuration
terraform validate

# Format Terraform files
terraform fmt

# Show current state
terraform show
```

## Contributing

1. Create a feature branch
2. Make your changes
3. Run `terraform fmt` and `terraform validate`
4. Create a pull request
5. GitHub Actions will run a plan automatically
6. After approval, manually trigger the apply workflow

## Environment Management

This repository supports multiple environments:
- **dev** - Development environment
- **staging** - Staging environment  
- **prod** - Production environment

Each environment should have its own `.tfvars` file and can be deployed independently through GitHub Actions.

## Related Projects

- [mews-infra](../mews-infra) - EKS cluster infrastructure
- [mews-helm-chart](../mews-helm-chart) - Application deployment charts

## Support

For issues and questions:
1. Check the troubleshooting section above
2. Review GitHub Actions logs
3. Contact the infrastructure team
- **Cost optimization** through automated cleanup

## Cost Management

ECR repositories incur costs based on:
- Storage used by images (~$0.10 per GB/month)
- Data transfer (if pulling from outside AWS)

Use `terraform destroy` when repositories are no longer needed to avoid ongoing storage costs.
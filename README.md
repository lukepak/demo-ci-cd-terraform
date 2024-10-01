## Remote State Management

This project uses AWS S3 for remote state management along with DynamoDB for state locking to ensure a consistent and reliable infrastructure deployment.

### Setting Up Remote State

1. **Create S3 Bucket and DynamoDB Table**:
   - The S3 bucket and DynamoDB table can be created using the Terraform script located in the `infrastructure` directory.

   ```bash
   cd backend
   terraform init
   terraform apply

# Nginx on EKS using Terraform and GitLab CI

This repository provides the infrastructure code to deploy an Nginx application on an Amazon EKS cluster using Terraform and managed through GitLab CI/CD.

## Project Structure

- `environments/`: Contains environment-specific Terraform configurations (dev, staging, production).
- `modules/`: Terraform modules for reusable components like VPC, EKS, and Nginx.
- `.gitlab-ci.yml`: GitLab CI pipeline configuration to manage deployments across different environments.

## Setup

1. **GitLab Environment Variables**:
   - Define the following environment variables in your GitLab project for each environment:
     - `AWS_ACCESS_KEY_ID`: The AWS access key ID for the specific environment.
     - `AWS_SECRET_ACCESS_KEY`: The AWS secret access key for the specific environment.
     - `AWS_REGION`: The AWS region where resources will be deployed.

2. **Initialize Terraform State**:
   - Make sure to configure a remote backend (e.g., AWS S3) to store Terraform state files for each environment.

3. **GitLab CI Pipeline**:
   - When you create a merge request, the pipeline runs `terraform plan` for review.
   - Merging to `master` will trigger the `terraform apply` for the production environment.
   - Other environment branches (`dev`, `staging`) are similarly handled.

## Usage

1. **Create a New Environment**:
   - For each environment (dev, staging, production), customize the Terraform variables in the respective `.tfvars` file located in the `environments/` folder.

2. **Git Workflow**:
   - Use separate branches for each environment:
     - `dev`: Development environment.
     - `staging`: Staging environment.
     - `master`: Production environment.

3. **Trigger Deployment**:
   - The pipeline will automatically apply changes upon merge to the `master` branch for production, or the relevant environment branches.
# demo-ci-cd-terraform

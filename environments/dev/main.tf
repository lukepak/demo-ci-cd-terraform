terraform {
  backend "s3" {
    bucket         = "kiemnd-demo-eks-terraform-${terraform.workspace}" # Use '-' instead of removing it to avoid confusion
    key            = "terraform/state/${terraform.workspace}.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks" # DynamoDB table for state locking
    encrypt        = true
  }
}

provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source           = "../../modules/eks"
  cluster_name     = "${terraform.workspace}-cluster" 
  subnet_ids       = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
  cluster_role_arn = "arn:aws:iam::123456789012:role/EKSRole" # Ensure this role exists
  node_role_arn    = "arn:aws:iam::123456789012:role/EKSNodeRole" # Ensure this role exists
  desired_capacity  = 2
  max_size         = 3
  min_size         = 1
}

module "nginx" {
  source           = "../../modules/nginx"
  cluster_endpoint = module.eks.cluster_endpoint
  replicas         = 2
}




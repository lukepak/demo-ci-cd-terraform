git clone https://github.com/lukepak/kiemnd-sun terraform-sunprovider "aws" {
  region = "us-west-2"
}

module "eks" {
  source          = "../../modules/eks"
  cluster_name    = "dev-cluster"
  subnet_ids      = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
  cluster_role_arn = "arn:aws:iam::123456789012:role/EKSRole"
  node_role_arn    = "arn:aws:iam::123456789012:role/EKSNodeRole"
  desired_capacity = 2
  max_size         = 3
  min_size         = 1
}

module "nginx" {
  source             = "../../modules/nginx"
  cluster_endpoint   = module.eks.cluster_endpoint
  replicas           = 2
}
terraform {
  backend "s3" {
    bucket         = "kiemnd-demo-eks-terraform${terraform.workspace}"
    key            = "terraform/state/${terraform.workspace}.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks" # DynamoDB table for state locking
    encrypt        = true
  }
}



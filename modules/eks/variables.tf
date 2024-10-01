# AWS region
variable "aws_region" {
  type        = string
  description = "The AWS region where the EKS cluster will be created."
}

# Cluster name
variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster."
}

# Cluster role ARN
variable "cluster_role_arn" {
  type        = string
  description = "IAM role ARN for the EKS cluster."
}

# Node group role ARN
variable "node_role_arn" {
  type        = string
  description = "IAM role ARN for the EKS node group."
}

# VPC subnet IDs
variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the EKS cluster."
}

# Desired capacity of the node group
variable "desired_capacity" {
  type        = number
  description = "The desired number of nodes in the node group."
}

# Minimum size of the node group
variable "min_size" {
  type        = number
  description = "The minimum number of nodes in the node group."
}

# Maximum size of the node group
variable "max_size" {
  type        = number
  description = "The maximum number of nodes in the node group."
}


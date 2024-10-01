# Output the EKS cluster name
output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.name
}

# Output the EKS cluster endpoint URL
output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.endpoint
}

# Output the EKS node group name
output "node_group_name" {
  description = "The name of the EKS node group."
  value       = aws_eks_node_group.node_group.name
}


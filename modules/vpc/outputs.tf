output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "The public subnet IDs"
  value       = aws_subnet.public[*].id
}


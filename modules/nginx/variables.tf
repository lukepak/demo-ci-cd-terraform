# Kubernetes cluster endpoint
variable "cluster_endpoint" {
  type        = string
  description = "The endpoint of the Kubernetes cluster."
}

# Kubernetes cluster certificate
variable "cluster_certificate" {
  type        = string
  description = "The certificate authority data for the Kubernetes cluster."
}

# Kubernetes service account token
variable "cluster_token" {
  type        = string
  description = "The access token for the Kubernetes cluster."
}

# Number of replicas for the Nginx deployment
variable "replicas" {
  type        = number
  description = "The number of replicas for the Nginx deployment."
  default     = 2
}


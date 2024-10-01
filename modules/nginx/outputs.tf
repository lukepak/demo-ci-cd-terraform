# Output the public IP of the Nginx service
output "nginx_service_ip" {
  description = "The public IP or hostname of the Nginx service."
  value       = kubernetes_service.nginx_service.status[0].load_balancer[0].ingress[0].hostname
}


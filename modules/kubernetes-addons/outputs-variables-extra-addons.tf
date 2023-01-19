output "rabbitmq_cluster_operator" {
  description = "Map of attributes of the Helm release and IRSA created"
  value       = try(module.rabbitmq_cluster_operator[0], null)
}

output "redis" {
  description = "Map of attributes of the Helm release and IRSA created"
  value       = try(module.redis[0], null)
}

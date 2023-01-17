#-----------RABBITMQ CLUSTER OPERATOR-------------
variable "enable_rabbitmq_cluster_operator" {
  description = "Enable RabbitMQ Cluster Operator add-on"
  type        = bool
  default     = false
}

variable "rabbitmq_cluster_operator_helm_config" {
  description = "RabbitMQ Cluster Operator Helm Chart config"
  type        = any
  default     = {}
}

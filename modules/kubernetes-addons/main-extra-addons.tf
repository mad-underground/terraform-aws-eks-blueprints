module "rabbitmq_cluster_operator" {
  count             = var.enable_rabbitmq_cluster_operator ? 1 : 0
  source            = "./rabbitmq-cluster-operator"
  helm_config       = var.rabbitmq_cluster_operator_helm_config
  manage_via_gitops = var.argocd_manage_add_ons
  addon_context     = local.addon_context
}

module "redis" {
  count             = var.enable_redis ? 1 : 0
  source            = "./redis"
  helm_config       = var.redis_helm_config
  manage_via_gitops = var.argocd_manage_add_ons
  addon_context     = local.addon_context
}

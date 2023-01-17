locals {
  name = "rabbitmq-cluster-operator"
  namespace = "rabbitmq-system"
}

resource "kubernetes_namespace_v1" "this" {
  count = try(var.helm_config.create_namespace, true) && local.namespace != "kube-system" ? 1 : 0

  metadata {
    name = local.namespace
  }
}

module "helm_addon" {
  source = "../helm-addon"

  helm_config = merge(
    {
      name        = local.name
      chart       = local.name
      repository  = "https://charts.bitnami.com/bitnami"
      version     = "3.2.0"
      namespace   = try(kubernetes_namespace_v1.this[0].metadata[0].name, local.namespace)
      description = "RabbitMQ Cluster Operator"
    },
    var.helm_config
  )

  addon_context     = var.addon_context
  manage_via_gitops = var.manage_via_gitops
}

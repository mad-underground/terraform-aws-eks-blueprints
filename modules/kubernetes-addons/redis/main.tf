# https://github.com/bitnami/charts/tree/main/bitnami/redis
# Bootstraps a Redis® deployment on a Kubernetes cluster using the Helm package manager.
# Deploy a single master/multi replica cluster, with the option of enabling using Redis® Sentinel.
# Supports multiple databases.

locals {
  name = "redis"
  namespace = "redis"

  argocd_gitops_config = {
    enable = true
  }
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
      version     = "17.4.3"
      namespace   = try(kubernetes_namespace_v1.this[0].metadata[0].name, local.namespace)
      description = "Redis is an open source, in-memory data store used as a database, cache, streaming engine, and message broker."
    },
    var.helm_config
  )

  addon_context     = var.addon_context
  manage_via_gitops = var.manage_via_gitops
}

output "eks_cluster_id" {
  value = local.eks_cluster_id
}

output "eks_cluster" {
  value = var.eks_cluster.create_eks ? one(module.eks) : null
}

output "eks_managed_node_groups" {
  value = (local.enable_workers 
  ? {
      for k1,v1 in module.aws_eks_managed_node_groups: k1 => {
        for k2,v2 in v1: k2 => try(one(v2), v2, null)
      }
    }
  : null)
}

output "self_managed_node_groups" {
  value = (local.enable_workers
  ? {
      for k1,v1 in module.aws_eks_self_managed_node_groups: k1 => {
        for k2,v2 in v1: k2 => try(one(v2), v2, null)
      }
    }
  : null)
}

output "addons" {
  value = var.kubernetes_addons.eks_cluster_id == null ? null : one(module.kubernetes_addons)
}

output "aws_auth_config_map" {
  value = local.enable_workers ? one(kubernetes_config_map_v1_data.aws_auth) : null
}

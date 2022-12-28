output "eks_managed_node_groups" {
  value = {
    for k1,v1 in module.aws_eks_managed_node_groups: k1 => {
      for k2,v2 in v1: k2 => try(one(v2), v2, null)
    }
  }
}

output "self_managed_node_groups" {
  value = module.aws_eks_self_managed_node_groups
}

output "aws_auth_config_map" {
  value = kubernetes_config_map_v1_data.aws_auth
}

# ---------------------------------------------------------------------------------------------------------------------
# MANAGED NODE GROUPS
# ---------------------------------------------------------------------------------------------------------------------

module "aws_eks_managed_node_groups" {
  source = "../aws-eks-managed-node-groups"

  for_each = local.managed_node_groups

  managed_ng = each.value
  context    = local.node_group_context

  depends_on = [kubernetes_config_map_v1_data.aws_auth]
}

# ---------------------------------------------------------------------------------------------------------------------
# SELF MANAGED NODE GROUPS
# ---------------------------------------------------------------------------------------------------------------------

module "aws_eks_self_managed_node_groups" {
  source = "../aws-eks-self-managed-node-groups"

  for_each = local.self_managed_node_groups

  self_managed_ng = each.value
  context         = local.node_group_context

  depends_on = [kubernetes_config_map_v1_data.aws_auth]
}


resource "kubernetes_config_map" "aws_auth" {

  count = local.enable_workers ? 1 : 0

  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
    labels = {
        "app.kubernetes.io/managed-by" = "terraform-aws-eks-blueprints"
        "app.kubernetes.io/created-by" = "terraform-aws-eks-blueprints"
      }
  }

  data = {
    mapRoles = yamlencode(
      distinct(concat(
        local.managed_node_group_aws_auth_config_map,
        local.self_managed_node_group_aws_auth_config_map,
        try(var.node_groups.aws_auth_map_roles, []),
      ))
    )
    mapUsers    = yamlencode(try(var.node_groups.map_users, []))
    mapAccounts = yamlencode(try(var.node_groups.map_accounts, []))
  }

}

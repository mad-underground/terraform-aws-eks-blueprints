locals {
  cluster_encryption_config = length(var.eks.cluster_encryption_config) > 0 ? var.eks.cluster_encryption_config : [
    {
      provider_key_arn = try(module.kms[0].key_arn, var.eks.cluster_kms_key_arn)
      resources        = ["secrets"]
    }
  ]
}

module "kms" {
  count  = var.eks.create_eks && var.eks.cluster_kms_key_arn == null && var.eks.enable_cluster_encryption ? 1 : 0
  source = "./modules/aws-kms"

  alias                   = "alias/${var.eks.cluster_name}"
  description             = "${var.eks.cluster_name} EKS cluster secret encryption key"
  policy                  = data.aws_iam_policy_document.eks_key.json
  deletion_window_in_days = var.eks.cluster_kms_key_deletion_window_in_days
  tags                    = var.eks.tags
}

module "aws_eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "v18.29.1"

  create = var.eks.create_eks

  cluster_name     = var.eks.cluster_name
  cluster_version  = var.eks.cluster_version
  cluster_timeouts = var.eks.cluster_timeouts

  create_iam_role               = var.eks.create_iam_role
  iam_role_arn                  = var.eks.iam_role_arn
  iam_role_use_name_prefix      = false
  iam_role_name                 = local.cluster_iam_role_name
  iam_role_path                 = var.eks.iam_role_path
  iam_role_description          = var.eks.iam_role_description
  iam_role_permissions_boundary = var.eks.iam_role_permissions_boundary
  iam_role_additional_policies  = var.eks.iam_role_additional_policies

  subnet_ids                           = var.eks.private_subnet_ids
  control_plane_subnet_ids             = var.eks.control_plane_subnet_ids
  cluster_endpoint_private_access      = var.eks.cluster_endpoint_private_access
  cluster_endpoint_public_access       = var.eks.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs = var.eks.cluster_endpoint_public_access_cidrs
  cluster_ip_family                    = var.eks.cluster_ip_family
  cluster_service_ipv4_cidr            = var.eks.cluster_service_ipv4_cidr

  vpc_id                                  = var.eks.vpc_id
  create_cluster_security_group           = var.eks.create_cluster_security_group
  cluster_security_group_id               = var.eks.cluster_security_group_id
  cluster_security_group_name             = var.eks.cluster_security_group_name
  cluster_security_group_use_name_prefix  = var.eks.cluster_security_group_use_name_prefix
  cluster_security_group_description      = var.eks.cluster_security_group_description
  cluster_additional_security_group_ids   = var.eks.cluster_additional_security_group_ids
  cluster_security_group_additional_rules = var.eks.cluster_security_group_additional_rules
  cluster_security_group_tags             = var.eks.cluster_security_group_tags

  create_node_security_group           = var.eks.create_node_security_group
  node_security_group_name             = var.eks.node_security_group_name
  node_security_group_use_name_prefix  = var.eks.node_security_group_use_name_prefix
  node_security_group_description      = var.eks.node_security_group_description
  node_security_group_additional_rules = var.eks.node_security_group_additional_rules
  node_security_group_tags             = var.eks.node_security_group_tags

  enable_irsa              = var.eks.enable_irsa
  openid_connect_audiences = var.eks.openid_connect_audiences
  custom_oidc_thumbprints  = var.eks.custom_oidc_thumbprints

  create_cloudwatch_log_group            = var.eks.create_cloudwatch_log_group
  cluster_enabled_log_types              = var.eks.cluster_enabled_log_types
  cloudwatch_log_group_retention_in_days = var.eks.cloudwatch_log_group_retention_in_days
  cloudwatch_log_group_kms_key_id        = var.eks.cloudwatch_log_group_kms_key_id

  attach_cluster_encryption_policy = false
  cluster_encryption_config        = var.eks.enable_cluster_encryption ? local.cluster_encryption_config : []
  cluster_identity_providers       = var.eks.cluster_identity_providers

  tags = var.eks.tags
}

# ---------------------------------------------------------------------------------------------------------------------
# Amazon EMR on EKS Virtual Clusters
# ---------------------------------------------------------------------------------------------------------------------
module "emr_on_eks" {
  source = "./modules/emr-on-eks"

  for_each = { for key, value in var.eks.emr_on_eks_teams : key => value
    if var.eks.enable_emr_on_eks && length(var.eks.emr_on_eks_teams) > 0
  }

  emr_on_eks_teams              = each.value
  eks_cluster_id                = module.aws_eks.cluster_id
  iam_role_permissions_boundary = var.eks.iam_role_permissions_boundary
  tags                          = var.eks.tags

  depends_on = [kubernetes_config_map.aws_auth]
}

resource "kubernetes_config_map" "amazon_vpc_cni" {
  count = var.eks.enable_windows_support ? 1 : 0
  metadata {
    name      = "amazon-vpc-cni"
    namespace = "kube-system"
  }

  data = {
    "enable-windows-ipam" = var.eks.enable_windows_support ? "true" : "false"
  }

  depends_on = [
    module.aws_eks.cluster_id,
    data.http.eks_cluster_readiness[0]
  ]
}

# ---------------------------------------------------------------------------------------------------------------------
# Teams
# ---------------------------------------------------------------------------------------------------------------------
module "aws_eks_teams" {
  count  = length(var.eks.application_teams) > 0 || length(var.eks.platform_teams) > 0 ? 1 : 0
  source = "./modules/aws-eks-teams"

  application_teams             = var.eks.application_teams
  platform_teams                = var.eks.platform_teams
  iam_role_permissions_boundary = var.eks.iam_role_permissions_boundary
  eks_cluster_id                = module.aws_eks.cluster_id
  tags                          = var.eks.tags

  depends_on = [
    data.http.eks_cluster_readiness[0]
  ]
}

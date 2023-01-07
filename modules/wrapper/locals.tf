locals {

  eks_module = one(module.eks)

  eks_cluster_version = try(
    var.node_groups.eks_cluster_version, 
    var.kubernetes_addons.eks_cluster_version, 
    local.eks_module.eks_cluster_version, 
    null
  )
  
  eks_cluster_id = (
    var.node_groups != null 
    ? var.node_groups.eks_cluster_id
    : var.kubernetes_addons.eks_cluster_id != null 
    ? var.kubernetes_addons.eks_cluster_id
    : var.eks_cluster.create_eks
    ? try(local.eks_module.eks_cluster_id, var.eks_cluster.cluster_name)
    : null
  )

  vpc_id = try(var.node_groups.vpc_id, var.eks_cluster.vpc_id, null)
  cluster_ca_base64 = try(data.aws_eks_cluster.cluster.certificate_authority[0].data, null)
  cluster_endpoint = try(data.aws_eks_cluster.cluster.endpoint, null)
  private_subnet_ids = try(var.node_groups.private_subnet_ids, var.eks_cluster.private_subnet_ids, [])
  public_subnet_ids = try(var.node_groups.public_subnet_ids, var.eks_cluster.public_subnet_ids, [])
  node_security_group_ids = try(
    var.node_groups.node_security_group_ids, 
    [var.kubernetes_addons.eks_worker_security_group_id],
    [local.eks_module.worker_node_security_group_id],
    []
  )

  managed_node_groups = try(var.node_groups.managed_node_groups, {})
  self_managed_node_groups = try(var.node_groups.self_managed_node_groups, {})

  enable_self_managed_node_groups = length(local.self_managed_node_groups) > 0 ? true : false
  enable_managed_node_groups = length(local.managed_node_groups) > 0 ? true : false

  enable_workers = local.enable_self_managed_node_groups || local.enable_managed_node_groups ? true : false
  
  worker_security_group_ids = local.enable_workers ? local.node_security_group_ids : []

  context = {
    # Data resources
    aws_region_name = data.aws_region.current.name
    # aws_caller_identity
    aws_caller_identity_account_id = data.aws_caller_identity.current.account_id
    aws_caller_identity_arn        = data.aws_caller_identity.current.arn
    # aws_partition
    aws_partition_id         = data.aws_partition.current.id
    aws_partition_dns_suffix = data.aws_partition.current.dns_suffix
  }

  node_group_context = {
    # EKS Cluster Config
    eks_cluster_id    = local.eks_cluster_id
    cluster_ca_base64 = local.cluster_ca_base64
    cluster_endpoint  = local.cluster_endpoint
    cluster_version   = local.eks_cluster_version
    # VPC Config
    vpc_id             = local.vpc_id
    private_subnet_ids = local.private_subnet_ids
    public_subnet_ids  = local.public_subnet_ids

    # Worker Security Group
    worker_security_group_ids = local.worker_security_group_ids

    # Data sources
    aws_partition_dns_suffix = local.context.aws_partition_dns_suffix
    aws_partition_id         = local.context.aws_partition_id

    iam_role_path                 = try(var.node_groups.iam_role_path, null)
    iam_role_permissions_boundary = try(var.node_groups.iam_role_permissions_boundary, null)

    # Service IPv4/IPv6 CIDR range
    service_ipv6_cidr = try(var.node_groups.cluster_service_ipv6_cidr, null)
    service_ipv4_cidr = try(var.node_groups.cluster_service_ipv4_cidr, null)

    tags = try(var.node_groups.tags, {})
  }

  # Managed node IAM Roles for aws-auth
  managed_node_group_aws_auth_config_map = length(local.managed_node_groups) > 0 == true ? [
    for key, node in local.managed_node_groups : {
      rolearn : try(node.iam_role_arn, "arn:${local.context.aws_partition_id}:iam::${local.context.aws_caller_identity_account_id}:role/${local.eks_cluster_id}-${node.node_group_name}")
      username : "system:node:{{EC2PrivateDNSName}}"
      groups : [
        "system:bootstrappers",
        "system:nodes"
      ]
    }
  ] : []

  # Self Managed node IAM Roles for aws-auth
  self_managed_node_group_aws_auth_config_map = length(local.self_managed_node_groups) > 0 ? [
    for key, node in local.self_managed_node_groups : {
      rolearn : try(node.iam_role_arn, "arn:${local.context.aws_partition_id}:iam::${local.context.aws_caller_identity_account_id}:role/${local.eks_cluster_id}-${node.node_group_name}")
      username : "system:node:{{EC2PrivateDNSName}}"
      groups : [
        "system:bootstrappers",
        "system:nodes"
      ]
    } if node.launch_template_os != "windows"
  ] : []

}

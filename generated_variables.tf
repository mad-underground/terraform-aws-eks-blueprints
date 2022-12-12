variable "eks" {
  description = "AWS EKS resources to be created"
  type = object({
    # "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
    tags = optional(map(string), {})

    # "VPC Id"
    vpc_id = string

    # "List of private subnets Ids for the cluster and worker nodes"
    private_subnet_ids = optional(list(string), [])

    # "List of public subnets Ids for the worker nodes"
    public_subnet_ids = optional(list(string), [])

    # "A list of subnet IDs where the EKS cluster control plane (ENIs) will be provisioned. Used for expanding the pool of subnets used by nodes/node groups without replacing the EKS control plane"
    control_plane_subnet_ids = optional(list(string), [])

    # "Create EKS cluster"
    create_eks = optional(bool, true)

    # "Create, update, and delete timeout configurations for the cluster"
    cluster_timeouts = optional(map(string), {})

    # "EKS Cluster Name"
    cluster_name = optional(string, "")

    # "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.23`)"
    cluster_version = optional(string, "1.23")

    # "Toggle to create or assign cluster security group"
    create_cluster_security_group = optional(bool, true)

    # "Name to use on cluster security group created"
    cluster_security_group_name = optional(string, null)

    # "Determines whether cluster security group name (`cluster_security_group_name`) is used as a prefix"
    cluster_security_group_use_name_prefix = optional(bool, true)

    # "Description of the cluster security group created"
    cluster_security_group_description = optional(string, "EKS cluster security group")

    # "Security group to be used if creation of cluster security group is turned off"
    cluster_security_group_id = optional(string, "")

    # "List of additional, externally created security group IDs to attach to the cluster control plane"
    cluster_additional_security_group_ids = optional(list(string), [])

    # "List of additional security group rules to add to the cluster security group created. Set `source_node_security_group = true` inside rules to set the `node_security_group` as source"
    cluster_security_group_additional_rules = optional(any, {})

    # "A map of additional tags to add to the cluster security group created"
    cluster_security_group_tags = optional(map(string), {})

    # "Indicates whether or not the EKS public API server endpoint is enabled. Default to EKS resource and it is true"
    cluster_endpoint_public_access = optional(bool, true)

    # "Indicates whether or not the EKS private API server endpoint is enabled. Default to EKS resource and it is false"
    cluster_endpoint_private_access = optional(bool, false)

    # "List of CIDR blocks which can access the Amazon EKS public API server endpoint"
    cluster_endpoint_public_access_cidrs = optional(list(string), ["0.0.0.0/0"])

    # "A valid EKS Cluster KMS Key ARN to encrypt Kubernetes secrets"
    cluster_kms_key_arn = optional(string, null)

    # "The waiting period, specified in number of days (7 - 30). After the waiting period ends, AWS KMS deletes the KMS key"
    cluster_kms_key_deletion_window_in_days = optional(number, 30)

    # "A list of additional IAM ARNs that should have FULL access (kms:*) in the KMS key policy"
    cluster_kms_key_additional_admin_arns = optional(list(string), [])

    # "Determines whether cluster encryption is enabled"
    enable_cluster_encryption = optional(bool, true)

    # "Configuration block with encryption configuration for the cluster"
    cluster_encryption_config = optional(list(object({
      provider_key_arn = string
      resources        = list(string)
    })), [])

    # "The IP family used to assign Kubernetes pod and service addresses. Valid values are `ipv4` (default) and `ipv6`. You can only specify an IP family when you create a cluster, changing this value will force a new cluster to be created"
    cluster_ip_family = optional(string, "ipv4")

    # "The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks"
    cluster_service_ipv4_cidr = optional(string, null)

    # "The IPV6 Service CIDR block to assign Kubernetes service IP addresses"
    cluster_service_ipv6_cidr = optional(string, null)

    # "Determines whether a log group is created by this module for the cluster logs. If not, AWS will automatically create one if logging is enabled"
    create_cloudwatch_log_group = optional(bool, false)

    # "A list of the desired control plane logging to enable"
    cluster_enabled_log_types = optional(list(string), ["api", "audit", "authenticator", "controllerManager", "scheduler"])

    # "Number of days to retain log events. Default retention - 90 days"
    cloudwatch_log_group_retention_in_days = optional(number, 90)

    # "If a KMS Key ARN is set, this key will be used to encrypt the corresponding log group. Please be sure that the KMS Key has an appropriate key policy (https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html)"
    cloudwatch_log_group_kms_key_id = optional(string, null)

    # "Determines whether a an IAM role is created or to use an existing IAM role"
    create_iam_role = optional(bool, true)

    # "Existing IAM role ARN for the cluster. Required if `create_iam_role` is set to `false`"
    iam_role_arn = optional(string, null)

    # "Name to use on IAM role created"
    iam_role_name = optional(string, null)

    # "Cluster IAM role path"
    iam_role_path = optional(string, null)

    # "Description of the role"
    iam_role_description = optional(string, null)

    # "ARN of the policy that is used to set the permissions boundary for the IAM role"
    iam_role_permissions_boundary = optional(string, null)

    # "Additional policies to be added to the IAM role"
    iam_role_additional_policies = optional(list(string), [])

    # "Determines whether to create an OpenID Connect Provider for EKS to enable IRSA"
    enable_irsa = optional(bool, true)

    # "List of OpenID Connect audience client IDs to add to the IRSA provider"
    openid_connect_audiences = optional(list(string), [])

    # "Additional list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s)"
    custom_oidc_thumbprints = optional(list(string), [])

    # "Map of cluster identity provider configurations to enable for the cluster. Note - this is different/separate from IRSA"
    cluster_identity_providers = optional(any, {})

    # "Managed node groups configuration"
    managed_node_groups = optional(any, {})

    # "Self-managed node groups configuration"
    self_managed_node_groups = optional(any, {})

    # "Enable Windows support"
    enable_windows_support = optional(bool, false)

    # "Determines whether to create a security group for the node groups or use the existing `node_security_group_id`"
    create_node_security_group = optional(bool, true)

    # "Name to use on node security group created"
    node_security_group_name = optional(string, null)

    # "Determines whether node security group name (`node_security_group_name`) is used as a prefix"
    node_security_group_use_name_prefix = optional(bool, true)

    # "Description of the node security group created"
    node_security_group_description = optional(string, "EKS node shared security group")

    # "List of additional security group rules to add to the node security group created. Set `source_cluster_security_group = true` inside rules to set the `cluster_security_group` as source"
    node_security_group_additional_rules = optional(any, {})

    # "A map of additional tags to add to the node security group created"
    node_security_group_tags = optional(map(string), {})

    # "A list of additional security group ids to attach to worker instances"
    worker_additional_security_group_ids = optional(list(string), [])

    # "Fargate profile configuration"
    fargate_profiles = optional(any, {})

    # "Additional AWS account numbers to add to the aws-auth ConfigMap"
    map_accounts = optional(list(string), [])

    # "Additional IAM roles to add to the aws-auth ConfigMap"
    map_roles = optional(list(object({
      rolearn  = string
      username = string
      groups   = list(string)
    })), [])

    # "Additional IAM users to add to the aws-auth ConfigMap"
    map_users = optional(list(object({
      userarn  = string
      username = string
      groups   = list(string)
    })), [])

    # "Additional kubernetes labels applied on aws-auth ConfigMap"
    aws_auth_additional_labels = optional(map(string), {})

    # "The maximum time (in seconds) to wait for EKS API server endpoint to become healthy"
    eks_readiness_timeout = optional(number, "600")

    # "Enable EMR on EKS"
    enable_emr_on_eks = optional(bool, false)

    # "EMR on EKS Teams config"
    emr_on_eks_teams = optional(any, {})

    # "Map of maps of Application Teams to create"
    application_teams = optional(any, {})

    # "Map of maps of platform teams to create"
    platform_teams = optional(any, {})

  })
}

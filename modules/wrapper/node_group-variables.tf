variable "node_groups" {
  description = "AWS EKS node grouups to be created"
  default = null
  type = object({

    eks_cluster_version = string
    eks_cluster_id = string
    vpc_id = string
    node_security_group_ids = list(string)
    private_subnet_ids = optional(list(string), [])
    public_subnet_ids = optional(list(string), [])

    # "Managed node groups configuration"
    managed_node_groups = optional(any, {})

    # "Self-managed node groups configuration"
    self_managed_node_groups = optional(any, {})

    # "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
    tags = optional(map(string), {})

    # "The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks"
    cluster_service_ipv4_cidr = optional(string, null)

    # "The IPV6 Service CIDR block to assign Kubernetes service IP addresses"
    cluster_service_ipv6_cidr = optional(string, null)

    # "Cluster IAM role path"
    iam_role_path = optional(string, null)

    # "ARN of the policy that is used to set the permissions boundary for the IAM role"
    iam_role_permissions_boundary = optional(string, null)

    #-------------------------------
    # aws-auth Config Map
    #-------------------------------

    # "Additional IAM roles to add to the aws-auth ConfigMap"
    aws_auth_map_roles = optional(list(object({
      rolearn  = string
      username = string
      groups   = list(string)
    })), [])

    # "Additional AWS account numbers to add to the aws-auth ConfigMap"
    map_accounts = optional(list(string), [])

    # "Additional IAM users to add to the aws-auth ConfigMap"
    map_users = optional(list(object({
      userarn  = string
      username = string
      groups   = list(string)
    })), [])

    # "additional labels for auth"
    aws_auth_additional_labels = optional(map(string), {})

  })

}

output "eks_cluster_arn" {
  description = "Amazon EKS Cluster Name"
  value = module.eks.eks_cluster_arn
}

output "eks_cluster_id" {
  description = "Amazon EKS Cluster Name"
  value = module.eks.eks_cluster_id
}

output "eks_cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value = module.eks.eks_cluster_certificate_authority_data
}

output "eks_cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value = module.eks.eks_cluster_endpoint
}

output "eks_oidc_issuer_url" {
  description = "The URL on the EKS cluster OIDC Issuer"
  value = module.eks.eks_oidc_issuer_url
}

output "oidc_provider" {
  description = "The OpenID Connect identity provider (issuer URL without leading `https://`)"
  value = module.eks.oidc_provider
}

output "eks_oidc_provider_arn" {
  description = "The ARN of the OIDC Provider if `enable_irsa = true`."
  value = module.eks.eks_oidc_provider_arn
}

output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value = module.eks.configure_kubectl
}

output "eks_cluster_status" {
  description = "Amazon EKS Cluster Status"
  value = module.eks.eks_cluster_status
}

output "eks_cluster_version" {
  description = "The Kubernetes version for the cluster"
  value = module.eks.eks_cluster_version
}

output "cluster_primary_security_group_id" {
  description = "Cluster security group that was created by Amazon EKS for the cluster. Managed node groups use this security group for control-plane-to-data-plane communication. Referred to as 'Cluster security group' in the EKS console"
  value = module.eks.cluster_primary_security_group_id
}

output "cluster_security_group_id" {
  description = "EKS Control Plane Security Group ID"
  value = module.eks.cluster_security_group_id
}

output "cluster_security_group_arn" {
  description = "Amazon Resource Name (ARN) of the cluster security group"
  value = module.eks.cluster_security_group_arn
}

output "worker_node_security_group_arn" {
  description = "Amazon Resource Name (ARN) of the worker node shared security group"
  value = module.eks.worker_node_security_group_arn
}

output "worker_node_security_group_id" {
  description = "ID of the worker node shared security group"
  value = module.eks.worker_node_security_group_id
}

output "self_managed_node_groups" {
  description = "Outputs from EKS Self-managed node groups "
  value = module.eks.self_managed_node_groups
}

output "self_managed_node_group_iam_role_arns" {
  description = "IAM role arn's of self managed node groups"
  value = module.eks.self_managed_node_group_iam_role_arns
}

output "self_managed_node_group_autoscaling_groups" {
  description = "Autoscaling group names of self managed node groups"
  value = module.eks.self_managed_node_group_autoscaling_groups
}

output "self_managed_node_group_iam_instance_profile_id" {
  description = "IAM instance profile id of managed node groups"
  value = module.eks.self_managed_node_group_iam_instance_profile_id
}

output "self_managed_node_group_aws_auth_config_map" {
  description = "Self managed node groups AWS auth map"
  value = module.eks.self_managed_node_group_aws_auth_config_map
}

output "windows_node_group_aws_auth_config_map" {
  description = "Windows node groups AWS auth map"
  value = module.eks.windows_node_group_aws_auth_config_map
}

output "managed_node_groups" {
  description = "Outputs from EKS Managed node groups "
  value = module.eks.managed_node_groups
}

output "managed_node_groups_id" {
  description = "EKS Managed node groups id"
  value = module.eks.managed_node_groups_id
}

output "managed_node_groups_status" {
  description = "EKS Managed node groups status"
  value = module.eks.managed_node_groups_status
}

output "managed_node_group_arn" {
  description = "Managed node group arn"
  value = module.eks.managed_node_group_arn
}

output "managed_node_group_iam_role_names" {
  description = "IAM role names of managed node groups"
  value = module.eks.managed_node_group_iam_role_names
}

output "managed_node_group_iam_role_arns" {
  description = "IAM role arn's of managed node groups"
  value = module.eks.managed_node_group_iam_role_arns
}

output "managed_node_group_iam_instance_profile_id" {
  description = "IAM instance profile id of managed node groups"
  value = module.eks.managed_node_group_iam_instance_profile_id
}

output "managed_node_group_iam_instance_profile_arns" {
  description = "IAM instance profile arn's of managed node groups"
  value = module.eks.managed_node_group_iam_instance_profile_arns
}

output "managed_node_group_aws_auth_config_map" {
  description = "Managed node groups AWS auth map"
  value = module.eks.managed_node_group_aws_auth_config_map
}

output "fargate_profiles" {
  description = "Outputs from EKS Fargate profiles groups "
  value = module.eks.fargate_profiles
}

output "fargate_profiles_iam_role_arns" {
  description = "IAM role arn's for Fargate Profiles"
  value = module.eks.fargate_profiles_iam_role_arns
}

output "fargate_profiles_aws_auth_config_map" {
  description = "Fargate profiles AWS auth map"
  value = module.eks.fargate_profiles_aws_auth_config_map
}

output "emr_on_eks_role_arn" {
  description = "IAM execution role ARN for EMR on EKS"
  value = module.eks.emr_on_eks_role_arn
}

output "emr_on_eks_role_id" {
  description = "IAM execution role ID for EMR on EKS"
  value = module.eks.emr_on_eks_role_id
}

output "teams" {
  description = "Outputs from EKS Fargate profiles groups "
  value = module.eks.teams
}


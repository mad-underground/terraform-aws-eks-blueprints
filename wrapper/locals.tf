locals {
    eks_cluster_id = try(module.eks.eks_cluster_id, null)
}
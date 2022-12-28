data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_eks_cluster" "cluster" {
  name = local.eks_cluster_id
}

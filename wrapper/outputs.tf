output "cluster" {
  value = module.eks
}

output "addons" {
  value = module.kubernetes_addons
}

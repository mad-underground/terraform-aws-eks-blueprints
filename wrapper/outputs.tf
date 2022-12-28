output "addons" {
  value = var.addons.create_addons ? module.kubernetes_addons : null
}

output "adot_collector_haproxy" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.adot_collector_haproxy
}

output "adot_collector_java" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.adot_collector_java
}

output "adot_collector_memcached" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.adot_collector_memcached
}

output "adot_collector_nginx" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.adot_collector_nginx
}

output "agones" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.agones
}

output "airflow" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.airflow
}

output "appmesh_controller" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.appmesh_controller
}

output "argocd" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.argocd
}

output "argo_rollouts" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.argo_rollouts
}

output "argo_workflows" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.argo_workflows
}

output "aws_cloudwatch_metrics" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_cloudwatch_metrics
}

output "aws_coredns" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_coredns
}

output "aws_ebs_csi_driver" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_ebs_csi_driver
}

output "aws_efs_csi_driver" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_efs_csi_driver
}

output "aws_for_fluent_bit" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_for_fluent_bit
}

output "aws_fsx_csi_driver" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_fsx_csi_driver
}

output "aws_kube_proxy" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_kube_proxy
}

output "aws_load_balancer_controller" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_load_balancer_controller
}

output "aws_node_termination_handler" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_node_termination_handler
}

output "aws_privateca_issuer" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_privateca_issuer
}

output "aws_vpc_cni" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.aws_vpc_cni
}

output "calico" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.calico
}

output "cert_manager" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.cert_manager
}

output "cert_manager_csi_driver" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.cert_manager_csi_driver
}

output "cert_manager_istio_csr" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.cert_manager_istio_csr
}

output "chaos_mesh" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.chaos_mesh
}

output "cilium" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.cilium
}

output "cluster_autoscaler" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.cluster_autoscaler
}

output "coredns_autoscaler" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.coredns_autoscaler
}

output "crossplane" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.crossplane
}

output "csi_secrets_store_provider_aws" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.csi_secrets_store_provider_aws
}

output "datadog_operator" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.datadog_operator
}

output "external_dns" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.external_dns
}

output "external_secrets" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.external_secrets
}

output "fargate_fluentbit" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.fargate_fluentbit
}

output "gatekeeper" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.gatekeeper
}

output "grafana" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.grafana
}

output "ingress_nginx" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.ingress_nginx
}

output "karpenter" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.karpenter
}

output "keda" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.keda
}

output "kubecost" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.kubecost
}

output "kube_prometheus_stack" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.kube_prometheus_stack
}

output "kuberay_operator" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.kuberay_operator
}

output "kubernetes_dashboard" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.kubernetes_dashboard
}

output "kyverno" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.kyverno
}

output "local_volume_provisioner" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.local_volume_provisioner
}

output "metrics_server" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.metrics_server
}

output "nvidia_device_plugin" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.nvidia_device_plugin
}

output "opentelemetry_operator" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.opentelemetry_operator
}

output "prometheus" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.prometheus
}

output "promtail" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.promtail
}

output "reloader" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.reloader
}

output "secrets_store_csi_driver" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.secrets_store_csi_driver
}

output "smb_csi_driver" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.smb_csi_driver
}

output "spark_history_server" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.spark_history_server
}

output "spark_k8s_operator" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.spark_k8s_operator
}

output "strimzi_kafka_operator" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.strimzi_kafka_operator
}

output "traefik" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.traefik
}

output "velero" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.velero
}

output "vpa" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.vpa
}

output "yunikorn" {
  description = "Map of attributes of the Helm release and IRSA created"
  value = module.kubernetes_addons.yunikorn
}

output "emr_on_eks" {
  description = "EMR on EKS"
  value = module.kubernetes_addons.emr_on_eks
}


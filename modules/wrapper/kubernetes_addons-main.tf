module "kubernetes_addons" {
  source = "../kubernetes-addons/"
  count = var.kubernetes_addons.eks_cluster_id == null ? 0 : 1
  eks_cluster_id = var.kubernetes_addons.eks_cluster_id
  eks_cluster_domain = var.kubernetes_addons.eks_cluster_domain
  eks_worker_security_group_id = var.kubernetes_addons.eks_worker_security_group_id
  data_plane_wait_arn = var.kubernetes_addons.data_plane_wait_arn
  auto_scaling_group_names = var.kubernetes_addons.auto_scaling_group_names
  tags = var.kubernetes_addons.tags
  irsa_iam_role_path = var.kubernetes_addons.irsa_iam_role_path
  irsa_iam_permissions_boundary = var.kubernetes_addons.irsa_iam_permissions_boundary
  eks_oidc_provider = var.kubernetes_addons.eks_oidc_provider
  eks_oidc_provider_arn = var.kubernetes_addons.eks_oidc_provider_arn
  eks_cluster_endpoint = var.kubernetes_addons.eks_cluster_endpoint
  eks_cluster_version = var.kubernetes_addons.eks_cluster_version
  enable_ipv6 = var.kubernetes_addons.enable_ipv6
  amazon_eks_vpc_cni_config = var.kubernetes_addons.amazon_eks_vpc_cni_config
  enable_amazon_eks_coredns = var.kubernetes_addons.enable_amazon_eks_coredns
  amazon_eks_coredns_config = var.kubernetes_addons.amazon_eks_coredns_config
  enable_self_managed_coredns = var.kubernetes_addons.enable_self_managed_coredns
  self_managed_coredns_helm_config = var.kubernetes_addons.self_managed_coredns_helm_config
  remove_default_coredns_deployment = var.kubernetes_addons.remove_default_coredns_deployment
  enable_coredns_cluster_proportional_autoscaler = var.kubernetes_addons.enable_coredns_cluster_proportional_autoscaler
  coredns_cluster_proportional_autoscaler_helm_config = var.kubernetes_addons.coredns_cluster_proportional_autoscaler_helm_config
  amazon_eks_kube_proxy_config = var.kubernetes_addons.amazon_eks_kube_proxy_config
  amazon_eks_aws_ebs_csi_driver_config = var.kubernetes_addons.amazon_eks_aws_ebs_csi_driver_config
  enable_amazon_eks_vpc_cni = var.kubernetes_addons.enable_amazon_eks_vpc_cni
  enable_amazon_eks_kube_proxy = var.kubernetes_addons.enable_amazon_eks_kube_proxy
  enable_amazon_eks_aws_ebs_csi_driver = var.kubernetes_addons.enable_amazon_eks_aws_ebs_csi_driver
  enable_self_managed_aws_ebs_csi_driver = var.kubernetes_addons.enable_self_managed_aws_ebs_csi_driver
  self_managed_aws_ebs_csi_driver_helm_config = var.kubernetes_addons.self_managed_aws_ebs_csi_driver_helm_config
  custom_image_registry_uri = var.kubernetes_addons.custom_image_registry_uri
  enable_cluster_autoscaler = var.kubernetes_addons.enable_cluster_autoscaler
  cluster_autoscaler_helm_config = var.kubernetes_addons.cluster_autoscaler_helm_config
  enable_coredns_autoscaler = var.kubernetes_addons.enable_coredns_autoscaler
  coredns_autoscaler_helm_config = var.kubernetes_addons.coredns_autoscaler_helm_config
  enable_appmesh_controller = var.kubernetes_addons.enable_appmesh_controller
  appmesh_helm_config = var.kubernetes_addons.appmesh_helm_config
  appmesh_irsa_policies = var.kubernetes_addons.appmesh_irsa_policies
  enable_crossplane = var.kubernetes_addons.enable_crossplane
  crossplane_helm_config = var.kubernetes_addons.crossplane_helm_config
  crossplane_aws_provider = var.kubernetes_addons.crossplane_aws_provider
  crossplane_jet_aws_provider = var.kubernetes_addons.crossplane_jet_aws_provider
  crossplane_kubernetes_provider = var.kubernetes_addons.crossplane_kubernetes_provider
  enable_ondat = var.kubernetes_addons.enable_ondat
  ondat_helm_config = var.kubernetes_addons.ondat_helm_config
  ondat_irsa_policies = var.kubernetes_addons.ondat_irsa_policies
  ondat_create_cluster = var.kubernetes_addons.ondat_create_cluster
  ondat_etcd_endpoints = var.kubernetes_addons.ondat_etcd_endpoints
  ondat_etcd_ca = var.kubernetes_addons.ondat_etcd_ca
  ondat_etcd_cert = var.kubernetes_addons.ondat_etcd_cert
  ondat_etcd_key = var.kubernetes_addons.ondat_etcd_key
  ondat_admin_username = var.kubernetes_addons.ondat_admin_username
  ondat_admin_password = var.kubernetes_addons.ondat_admin_password
  enable_external_dns = var.kubernetes_addons.enable_external_dns
  external_dns_helm_config = var.kubernetes_addons.external_dns_helm_config
  external_dns_irsa_policies = var.kubernetes_addons.external_dns_irsa_policies
  external_dns_private_zone = var.kubernetes_addons.external_dns_private_zone
  external_dns_route53_zone_arns = var.kubernetes_addons.external_dns_route53_zone_arns
  enable_amazon_prometheus = var.kubernetes_addons.enable_amazon_prometheus
  amazon_prometheus_workspace_endpoint = var.kubernetes_addons.amazon_prometheus_workspace_endpoint
  amazon_prometheus_workspace_region = var.kubernetes_addons.amazon_prometheus_workspace_region
  enable_prometheus = var.kubernetes_addons.enable_prometheus
  prometheus_helm_config = var.kubernetes_addons.prometheus_helm_config
  enable_kube_prometheus_stack = var.kubernetes_addons.enable_kube_prometheus_stack
  kube_prometheus_stack_helm_config = var.kubernetes_addons.kube_prometheus_stack_helm_config
  enable_metrics_server = var.kubernetes_addons.enable_metrics_server
  metrics_server_helm_config = var.kubernetes_addons.metrics_server_helm_config
  enable_sysdig_agent = var.kubernetes_addons.enable_sysdig_agent
  sysdig_agent_helm_config = var.kubernetes_addons.sysdig_agent_helm_config
  enable_tetrate_istio = var.kubernetes_addons.enable_tetrate_istio
  tetrate_istio_distribution = var.kubernetes_addons.tetrate_istio_distribution
  tetrate_istio_version = var.kubernetes_addons.tetrate_istio_version
  tetrate_istio_install_base = var.kubernetes_addons.tetrate_istio_install_base
  tetrate_istio_install_cni = var.kubernetes_addons.tetrate_istio_install_cni
  tetrate_istio_install_istiod = var.kubernetes_addons.tetrate_istio_install_istiod
  tetrate_istio_install_gateway = var.kubernetes_addons.tetrate_istio_install_gateway
  tetrate_istio_base_helm_config = var.kubernetes_addons.tetrate_istio_base_helm_config
  tetrate_istio_cni_helm_config = var.kubernetes_addons.tetrate_istio_cni_helm_config
  tetrate_istio_istiod_helm_config = var.kubernetes_addons.tetrate_istio_istiod_helm_config
  tetrate_istio_gateway_helm_config = var.kubernetes_addons.tetrate_istio_gateway_helm_config
  enable_thanos = var.kubernetes_addons.enable_thanos
  thanos_helm_config = var.kubernetes_addons.thanos_helm_config
  thanos_irsa_policies = var.kubernetes_addons.thanos_irsa_policies
  enable_traefik = var.kubernetes_addons.enable_traefik
  traefik_helm_config = var.kubernetes_addons.traefik_helm_config
  enable_agones = var.kubernetes_addons.enable_agones
  agones_helm_config = var.kubernetes_addons.agones_helm_config
  enable_aws_efs_csi_driver = var.kubernetes_addons.enable_aws_efs_csi_driver
  aws_efs_csi_driver_helm_config = var.kubernetes_addons.aws_efs_csi_driver_helm_config
  aws_efs_csi_driver_irsa_policies = var.kubernetes_addons.aws_efs_csi_driver_irsa_policies
  enable_aws_fsx_csi_driver = var.kubernetes_addons.enable_aws_fsx_csi_driver
  aws_fsx_csi_driver_helm_config = var.kubernetes_addons.aws_fsx_csi_driver_helm_config
  aws_fsx_csi_driver_irsa_policies = var.kubernetes_addons.aws_fsx_csi_driver_irsa_policies
  enable_aws_load_balancer_controller = var.kubernetes_addons.enable_aws_load_balancer_controller
  aws_load_balancer_controller_helm_config = var.kubernetes_addons.aws_load_balancer_controller_helm_config
  enable_ingress_nginx = var.kubernetes_addons.enable_ingress_nginx
  ingress_nginx_helm_config = var.kubernetes_addons.ingress_nginx_helm_config
  enable_spark_history_server = var.kubernetes_addons.enable_spark_history_server
  spark_history_server_helm_config = var.kubernetes_addons.spark_history_server_helm_config
  spark_history_server_s3a_path = var.kubernetes_addons.spark_history_server_s3a_path
  spark_history_server_irsa_policies = var.kubernetes_addons.spark_history_server_irsa_policies
  enable_spark_k8s_operator = var.kubernetes_addons.enable_spark_k8s_operator
  spark_k8s_operator_helm_config = var.kubernetes_addons.spark_k8s_operator_helm_config
  enable_aws_for_fluentbit = var.kubernetes_addons.enable_aws_for_fluentbit
  aws_for_fluentbit_helm_config = var.kubernetes_addons.aws_for_fluentbit_helm_config
  aws_for_fluentbit_irsa_policies = var.kubernetes_addons.aws_for_fluentbit_irsa_policies
  aws_for_fluentbit_create_cw_log_group = var.kubernetes_addons.aws_for_fluentbit_create_cw_log_group
  aws_for_fluentbit_cw_log_group_name = var.kubernetes_addons.aws_for_fluentbit_cw_log_group_name
  aws_for_fluentbit_cw_log_group_retention = var.kubernetes_addons.aws_for_fluentbit_cw_log_group_retention
  aws_for_fluentbit_cw_log_group_kms_key_arn = var.kubernetes_addons.aws_for_fluentbit_cw_log_group_kms_key_arn
  enable_aws_cloudwatch_metrics = var.kubernetes_addons.enable_aws_cloudwatch_metrics
  aws_cloudwatch_metrics_helm_config = var.kubernetes_addons.aws_cloudwatch_metrics_helm_config
  aws_cloudwatch_metrics_irsa_policies = var.kubernetes_addons.aws_cloudwatch_metrics_irsa_policies
  enable_fargate_fluentbit = var.kubernetes_addons.enable_fargate_fluentbit
  fargate_fluentbit_addon_config = var.kubernetes_addons.fargate_fluentbit_addon_config
  enable_cert_manager = var.kubernetes_addons.enable_cert_manager
  cert_manager_helm_config = var.kubernetes_addons.cert_manager_helm_config
  cert_manager_irsa_policies = var.kubernetes_addons.cert_manager_irsa_policies
  cert_manager_domain_names = var.kubernetes_addons.cert_manager_domain_names
  cert_manager_install_letsencrypt_issuers = var.kubernetes_addons.cert_manager_install_letsencrypt_issuers
  cert_manager_letsencrypt_email = var.kubernetes_addons.cert_manager_letsencrypt_email
  enable_cert_manager_csi_driver = var.kubernetes_addons.enable_cert_manager_csi_driver
  cert_manager_csi_driver_helm_config = var.kubernetes_addons.cert_manager_csi_driver_helm_config
  cert_manager_kubernetes_svc_image_pull_secrets = var.kubernetes_addons.cert_manager_kubernetes_svc_image_pull_secrets
  enable_cert_manager_istio_csr = var.kubernetes_addons.enable_cert_manager_istio_csr
  cert_manager_istio_csr_helm_config = var.kubernetes_addons.cert_manager_istio_csr_helm_config
  enable_argo_workflows = var.kubernetes_addons.enable_argo_workflows
  argo_workflows_helm_config = var.kubernetes_addons.argo_workflows_helm_config
  enable_argo_rollouts = var.kubernetes_addons.enable_argo_rollouts
  argo_rollouts_helm_config = var.kubernetes_addons.argo_rollouts_helm_config
  enable_argocd = var.kubernetes_addons.enable_argocd
  argocd_helm_config = var.kubernetes_addons.argocd_helm_config
  argocd_applications = var.kubernetes_addons.argocd_applications
  argocd_manage_add_ons = var.kubernetes_addons.argocd_manage_add_ons
  enable_aws_node_termination_handler = var.kubernetes_addons.enable_aws_node_termination_handler
  aws_node_termination_handler_helm_config = var.kubernetes_addons.aws_node_termination_handler_helm_config
  aws_node_termination_handler_irsa_policies = var.kubernetes_addons.aws_node_termination_handler_irsa_policies
  enable_karpenter = var.kubernetes_addons.enable_karpenter
  karpenter_helm_config = var.kubernetes_addons.karpenter_helm_config
  karpenter_irsa_policies = var.kubernetes_addons.karpenter_irsa_policies
  karpenter_node_iam_instance_profile = var.kubernetes_addons.karpenter_node_iam_instance_profile
  karpenter_sqs_queue_arn = var.kubernetes_addons.karpenter_sqs_queue_arn
  enable_keda = var.kubernetes_addons.enable_keda
  keda_helm_config = var.kubernetes_addons.keda_helm_config
  keda_irsa_policies = var.kubernetes_addons.keda_irsa_policies
  enable_kubernetes_dashboard = var.kubernetes_addons.enable_kubernetes_dashboard
  kubernetes_dashboard_helm_config = var.kubernetes_addons.kubernetes_dashboard_helm_config
  enable_vault = var.kubernetes_addons.enable_vault
  vault_helm_config = var.kubernetes_addons.vault_helm_config
  enable_vpa = var.kubernetes_addons.enable_vpa
  vpa_helm_config = var.kubernetes_addons.vpa_helm_config
  enable_yunikorn = var.kubernetes_addons.enable_yunikorn
  yunikorn_helm_config = var.kubernetes_addons.yunikorn_helm_config
  enable_aws_privateca_issuer = var.kubernetes_addons.enable_aws_privateca_issuer
  aws_privateca_issuer_helm_config = var.kubernetes_addons.aws_privateca_issuer_helm_config
  aws_privateca_acmca_arn = var.kubernetes_addons.aws_privateca_acmca_arn
  aws_privateca_issuer_irsa_policies = var.kubernetes_addons.aws_privateca_issuer_irsa_policies
  enable_opentelemetry_operator = var.kubernetes_addons.enable_opentelemetry_operator
  opentelemetry_operator_helm_config = var.kubernetes_addons.opentelemetry_operator_helm_config
  enable_amazon_eks_adot = var.kubernetes_addons.enable_amazon_eks_adot
  amazon_eks_adot_config = var.kubernetes_addons.amazon_eks_adot_config
  enable_velero = var.kubernetes_addons.enable_velero
  velero_helm_config = var.kubernetes_addons.velero_helm_config
  velero_irsa_policies = var.kubernetes_addons.velero_irsa_policies
  velero_backup_s3_bucket = var.kubernetes_addons.velero_backup_s3_bucket
  enable_adot_collector_java = var.kubernetes_addons.enable_adot_collector_java
  adot_collector_java_helm_config = var.kubernetes_addons.adot_collector_java_helm_config
  enable_adot_collector_haproxy = var.kubernetes_addons.enable_adot_collector_haproxy
  adot_collector_haproxy_helm_config = var.kubernetes_addons.adot_collector_haproxy_helm_config
  enable_adot_collector_memcached = var.kubernetes_addons.enable_adot_collector_memcached
  adot_collector_memcached_helm_config = var.kubernetes_addons.adot_collector_memcached_helm_config
  enable_adot_collector_nginx = var.kubernetes_addons.enable_adot_collector_nginx
  adot_collector_nginx_helm_config = var.kubernetes_addons.adot_collector_nginx_helm_config
  enable_secrets_store_csi_driver_provider_aws = var.kubernetes_addons.enable_secrets_store_csi_driver_provider_aws
  csi_secrets_store_provider_aws_helm_config = var.kubernetes_addons.csi_secrets_store_provider_aws_helm_config
  enable_secrets_store_csi_driver = var.kubernetes_addons.enable_secrets_store_csi_driver
  secrets_store_csi_driver_helm_config = var.kubernetes_addons.secrets_store_csi_driver_helm_config
  enable_external_secrets = var.kubernetes_addons.enable_external_secrets
  external_secrets_helm_config = var.kubernetes_addons.external_secrets_helm_config
  external_secrets_irsa_policies = var.kubernetes_addons.external_secrets_irsa_policies
  external_secrets_ssm_parameter_arns = var.kubernetes_addons.external_secrets_ssm_parameter_arns
  external_secrets_secrets_manager_arns = var.kubernetes_addons.external_secrets_secrets_manager_arns
  enable_grafana = var.kubernetes_addons.enable_grafana
  grafana_helm_config = var.kubernetes_addons.grafana_helm_config
  grafana_irsa_policies = var.kubernetes_addons.grafana_irsa_policies
  enable_kuberay_operator = var.kubernetes_addons.enable_kuberay_operator
  kuberay_operator_helm_config = var.kubernetes_addons.kuberay_operator_helm_config
  enable_reloader = var.kubernetes_addons.enable_reloader
  reloader_helm_config = var.kubernetes_addons.reloader_helm_config
  enable_airflow = var.kubernetes_addons.enable_airflow
  airflow_helm_config = var.kubernetes_addons.airflow_helm_config
  enable_strimzi_kafka_operator = var.kubernetes_addons.enable_strimzi_kafka_operator
  strimzi_kafka_operator_helm_config = var.kubernetes_addons.strimzi_kafka_operator_helm_config
  enable_datadog_operator = var.kubernetes_addons.enable_datadog_operator
  datadog_operator_helm_config = var.kubernetes_addons.datadog_operator_helm_config
  enable_promtail = var.kubernetes_addons.enable_promtail
  promtail_helm_config = var.kubernetes_addons.promtail_helm_config
  enable_calico = var.kubernetes_addons.enable_calico
  calico_helm_config = var.kubernetes_addons.calico_helm_config
  enable_kubecost = var.kubernetes_addons.enable_kubecost
  kubecost_helm_config = var.kubernetes_addons.kubecost_helm_config
  enable_kyverno = var.kubernetes_addons.enable_kyverno
  enable_kyverno_policies = var.kubernetes_addons.enable_kyverno_policies
  enable_kyverno_policy_reporter = var.kubernetes_addons.enable_kyverno_policy_reporter
  kyverno_helm_config = var.kubernetes_addons.kyverno_helm_config
  kyverno_policies_helm_config = var.kubernetes_addons.kyverno_policies_helm_config
  kyverno_policy_reporter_helm_config = var.kubernetes_addons.kyverno_policy_reporter_helm_config
  enable_smb_csi_driver = var.kubernetes_addons.enable_smb_csi_driver
  smb_csi_driver_helm_config = var.kubernetes_addons.smb_csi_driver_helm_config
  enable_chaos_mesh = var.kubernetes_addons.enable_chaos_mesh
  chaos_mesh_helm_config = var.kubernetes_addons.chaos_mesh_helm_config
  enable_cilium = var.kubernetes_addons.enable_cilium
  cilium_helm_config = var.kubernetes_addons.cilium_helm_config
  cilium_enable_wireguard = var.kubernetes_addons.cilium_enable_wireguard
  enable_gatekeeper = var.kubernetes_addons.enable_gatekeeper
  gatekeeper_helm_config = var.kubernetes_addons.gatekeeper_helm_config
  enable_portworx = var.kubernetes_addons.enable_portworx
  portworx_helm_config = var.kubernetes_addons.portworx_helm_config
  enable_local_volume_provisioner = var.kubernetes_addons.enable_local_volume_provisioner
  local_volume_provisioner_helm_config = var.kubernetes_addons.local_volume_provisioner_helm_config
  enable_nvidia_device_plugin = var.kubernetes_addons.enable_nvidia_device_plugin
  nvidia_device_plugin_helm_config = var.kubernetes_addons.nvidia_device_plugin_helm_config
  enable_app_2048 = var.kubernetes_addons.enable_app_2048
  enable_emr_on_eks = var.kubernetes_addons.enable_emr_on_eks
  emr_on_eks_config = var.kubernetes_addons.emr_on_eks_config
  enable_consul = var.kubernetes_addons.enable_consul
  consul_helm_config = var.kubernetes_addons.consul_helm_config
  enable_rabbitmq_cluster_operator = var.kubernetes_addons.enable_rabbitmq_cluster_operator
  rabbitmq_cluster_operator_helm_config = var.kubernetes_addons.rabbitmq_cluster_operator_helm_config
  enable_redis = var.kubernetes_addons.enable_redis
  redis_helm_config = var.kubernetes_addons.redis_helm_config
}
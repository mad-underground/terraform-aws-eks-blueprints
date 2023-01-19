variable "kubernetes_addons" {
  description = "AWS EKS kubernetes addons to be created"
  default = { eks_cluster_id = null }
  type = object({
    # "EKS Cluster Id"
    eks_cluster_id = string

    # "The domain for the EKS cluster"
    eks_cluster_domain = optional(string, "")

    # "EKS Worker Security group Id created by EKS module"
    eks_worker_security_group_id = optional(string, "")

    # "Addon deployment will not proceed until this value is known. Set to node group/Fargate profile ARN to wait for data plane to be ready before provisioning addons"
    data_plane_wait_arn = optional(string, "")

    # "List of self-managed node groups autoscaling group names"
    auto_scaling_group_names = optional(list(string), [])

    # "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
    tags = optional(map(string), {})

    # "IAM role path for IRSA roles"
    irsa_iam_role_path = optional(string, "/")

    # "IAM permissions boundary for IRSA roles"
    irsa_iam_permissions_boundary = optional(string, "")

    # "The OpenID Connect identity provider (issuer URL without leading `https://`)"
    eks_oidc_provider = optional(string, null)

    # "The OpenID Connect identity provider ARN"
    eks_oidc_provider_arn = optional(string, null)

    # "Endpoint for your Kubernetes API server"
    eks_cluster_endpoint = optional(string, null)

    # "The Kubernetes version for the cluster"
    eks_cluster_version = optional(string, null)

    # "Enable Ipv6 network. Attaches new VPC CNI policy to the IRSA role"
    enable_ipv6 = optional(bool, false)

    # "ConfigMap of Amazon EKS VPC CNI add-on"
    amazon_eks_vpc_cni_config = optional(any, {})

    # "Enable Amazon EKS CoreDNS add-on"
    enable_amazon_eks_coredns = optional(bool, false)

    # "Configuration for Amazon CoreDNS EKS add-on"
    amazon_eks_coredns_config = optional(any, {})

    # "Enable self-managed CoreDNS add-on"
    enable_self_managed_coredns = optional(bool, false)

    # "Self-managed CoreDNS Helm chart config"
    self_managed_coredns_helm_config = optional(any, {})

    # "Determines whether the default deployment of CoreDNS is removed and ownership of kube-dns passed to Helm"
    remove_default_coredns_deployment = optional(bool, false)

    # "Enable cluster-proportional-autoscaler for CoreDNS"
    enable_coredns_cluster_proportional_autoscaler = optional(bool, true)

    # "Helm provider config for the CoreDNS cluster-proportional-autoscaler"
    coredns_cluster_proportional_autoscaler_helm_config = optional(any, {})

    # "ConfigMap for Amazon EKS Kube-Proxy add-on"
    amazon_eks_kube_proxy_config = optional(any, {})

    # "configMap for AWS EBS CSI Driver add-on"
    amazon_eks_aws_ebs_csi_driver_config = optional(any, {})

    # "Enable VPC CNI add-on"
    enable_amazon_eks_vpc_cni = optional(bool, false)

    # "Enable Kube Proxy add-on"
    enable_amazon_eks_kube_proxy = optional(bool, false)

    # "Enable EKS Managed AWS EBS CSI Driver add-on; enable_amazon_eks_aws_ebs_csi_driver and enable_self_managed_aws_ebs_csi_driver are mutually exclusive"
    enable_amazon_eks_aws_ebs_csi_driver = optional(bool, false)

    # "Enable self-managed aws-ebs-csi-driver add-on; enable_self_managed_aws_ebs_csi_driver and enable_amazon_eks_aws_ebs_csi_driver are mutually exclusive"
    enable_self_managed_aws_ebs_csi_driver = optional(bool, false)

    # "Self-managed aws-ebs-csi-driver Helm chart config"
    self_managed_aws_ebs_csi_driver_helm_config = optional(any, {})

    # "Custom image registry URI map of `{region = dkr.endpoint }`"
    custom_image_registry_uri = optional(map(string), {})

    # "Enable Cluster autoscaler add-on"
    enable_cluster_autoscaler = optional(bool, false)

    # "Cluster Autoscaler Helm Chart config"
    cluster_autoscaler_helm_config = optional(any, {})

    # "Enable CoreDNS autoscaler add-on"
    enable_coredns_autoscaler = optional(bool, false)

    # "CoreDNS Autoscaler Helm Chart config"
    coredns_autoscaler_helm_config = optional(any, {})

    # "Enable AppMesh add-on"
    enable_appmesh_controller = optional(bool, false)

    # "AppMesh Helm Chart config"
    appmesh_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    appmesh_irsa_policies = optional(list(string), [])

    # "Enable Crossplane add-on"
    enable_crossplane = optional(bool, false)

    # "Crossplane Helm Chart config"
    crossplane_helm_config = optional(any, null)

    # "AWS Provider config for Crossplane"
    crossplane_aws_provider = optional(any, {
      enable = false
    })

    # "AWS Provider Jet AWS config for Crossplane"
    crossplane_jet_aws_provider = optional(object({
      enable                   = bool
      provider_aws_version     = string
      additional_irsa_policies = list(string)
    }), {
      enable                   = false
      provider_aws_version     = "v0.24.1"
      additional_irsa_policies = []
    })

    # "Kubernetes Provider config for Crossplane"
    crossplane_kubernetes_provider = optional(any, {
      enable = false
    })

    # "Enable Ondat add-on"
    enable_ondat = optional(bool, false)

    # "Ondat Helm Chart config"
    ondat_helm_config = optional(any, {})

    # "IAM policy ARNs for Ondat IRSA"
    ondat_irsa_policies = optional(list(string), [])

    # "Create cluster resources"
    ondat_create_cluster = optional(bool, true)

    # "List of etcd endpoints for Ondat"
    ondat_etcd_endpoints = optional(list(string), [])

    # "CA content for Ondat etcd"
    ondat_etcd_ca = optional(string, null)

    # "Certificate content for Ondat etcd"
    ondat_etcd_cert = optional(string, null)

    # "Private key content for Ondat etcd"
    ondat_etcd_key = optional(string, null)

    # "Username for Ondat admin user"
    ondat_admin_username = optional(string, "storageos")

    # "Password for Ondat admin user"
    ondat_admin_password = optional(string, "storageos")

    # "External DNS add-on"
    enable_external_dns = optional(bool, false)

    # "External DNS Helm Chart config"
    external_dns_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    external_dns_irsa_policies = optional(list(string), [])

    # "Determines if referenced Route53 zone is private."
    external_dns_private_zone = optional(bool, false)

    # "List of Route53 zones ARNs which external-dns will have access to create/manage records"
    external_dns_route53_zone_arns = optional(list(string), [])

    # "Enable AWS Managed Prometheus service"
    enable_amazon_prometheus = optional(bool, false)

    # "AWS Managed Prometheus WorkSpace Endpoint"
    amazon_prometheus_workspace_endpoint = optional(string, null)

    # "AWS Managed Prometheus WorkSpace Region"
    amazon_prometheus_workspace_region = optional(string, null)

    # "Enable Community Prometheus add-on"
    enable_prometheus = optional(bool, false)

    # "Community Prometheus Helm Chart config"
    prometheus_helm_config = optional(any, {})

    # "Enable Community kube-prometheus-stack add-on"
    enable_kube_prometheus_stack = optional(bool, false)

    # "Community kube-prometheus-stack Helm Chart config"
    kube_prometheus_stack_helm_config = optional(any, {})

    # "Enable metrics server add-on"
    enable_metrics_server = optional(bool, false)

    # "Metrics Server Helm Chart config"
    metrics_server_helm_config = optional(any, {})

    # "Enable Sysdig Agent add-on"
    enable_sysdig_agent = optional(bool, false)

    # "Sysdig Helm Chart config"
    sysdig_agent_helm_config = optional(any, {})

    # "Enable Tetrate Istio add-on"
    enable_tetrate_istio = optional(bool, false)

    # "Istio distribution"
    tetrate_istio_distribution = optional(string, "TID")

    # "Istio version"
    tetrate_istio_version = optional(string, "")

    # "Install Istio `base` Helm Chart"
    tetrate_istio_install_base = optional(bool, true)

    # "Install Istio `cni` Helm Chart"
    tetrate_istio_install_cni = optional(bool, true)

    # "Install Istio `istiod` Helm Chart"
    tetrate_istio_install_istiod = optional(bool, true)

    # "Install Istio `gateway` Helm Chart"
    tetrate_istio_install_gateway = optional(bool, true)

    # "Istio `base` Helm Chart config"
    tetrate_istio_base_helm_config = optional(any, {})

    # "Istio `cni` Helm Chart config"
    tetrate_istio_cni_helm_config = optional(any, {})

    # "Istio `istiod` Helm Chart config"
    tetrate_istio_istiod_helm_config = optional(any, {})

    # "Istio `gateway` Helm Chart config"
    tetrate_istio_gateway_helm_config = optional(any, {})

    # "Enable Thanos add-on"
    enable_thanos = optional(bool, false)

    # "Thanos Helm Chart config"
    thanos_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    thanos_irsa_policies = optional(list(string), [])

    # "Enable Traefik add-on"
    enable_traefik = optional(bool, false)

    # "Traefik Helm Chart config"
    traefik_helm_config = optional(any, {})

    # "Enable Agones GamServer add-on"
    enable_agones = optional(bool, false)

    # "Agones GameServer Helm Chart config"
    agones_helm_config = optional(any, {})

    # "Enable AWS EFS CSI driver add-on"
    enable_aws_efs_csi_driver = optional(bool, false)

    # "AWS EFS CSI driver Helm Chart config"
    aws_efs_csi_driver_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    aws_efs_csi_driver_irsa_policies = optional(list(string), [])

    # "Enable AWS FSx CSI driver add-on"
    enable_aws_fsx_csi_driver = optional(bool, false)

    # "AWS FSx CSI driver Helm Chart config"
    aws_fsx_csi_driver_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    aws_fsx_csi_driver_irsa_policies = optional(list(string), [])

    # "Enable AWS Load Balancer Controller add-on"
    enable_aws_load_balancer_controller = optional(bool, false)

    # "AWS Load Balancer Controller Helm Chart config"
    aws_load_balancer_controller_helm_config = optional(any, {})

    # "Enable Ingress Nginx add-on"
    enable_ingress_nginx = optional(bool, false)

    # "Ingress Nginx Helm Chart config"
    ingress_nginx_helm_config = optional(any, {})

    # "Enable Spark History Server add-on"
    enable_spark_history_server = optional(bool, false)

    # "Spark History Server Helm Chart config"
    spark_history_server_helm_config = optional(any, {})

    # "s3a path with prefix for Spark history server e.g., s3a://<bucket_name>/<spark_event_logs>"
    spark_history_server_s3a_path = optional(string, "")

    # "Additional IAM policies for a IAM role for service accounts"
    spark_history_server_irsa_policies = optional(list(string), [])

    # "Enable Spark on K8s Operator add-on"
    enable_spark_k8s_operator = optional(bool, false)

    # "Spark on K8s Operator Helm Chart config"
    spark_k8s_operator_helm_config = optional(any, {})

    # "Enable AWS for FluentBit add-on"
    enable_aws_for_fluentbit = optional(bool, false)

    # "AWS for FluentBit Helm Chart config"
    aws_for_fluentbit_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    aws_for_fluentbit_irsa_policies = optional(list(string), [])

    # "Set to false to use existing CloudWatch log group supplied via the cw_log_group_name variable."
    aws_for_fluentbit_create_cw_log_group = optional(bool, true)

    # "FluentBit CloudWatch Log group name"
    aws_for_fluentbit_cw_log_group_name = optional(string, null)

    # "FluentBit CloudWatch Log group retention period"
    aws_for_fluentbit_cw_log_group_retention = optional(number, 90)

    # "FluentBit CloudWatch Log group KMS Key"
    aws_for_fluentbit_cw_log_group_kms_key_arn = optional(string, null)

    # "Enable AWS CloudWatch Metrics add-on for Container Insights"
    enable_aws_cloudwatch_metrics = optional(bool, false)

    # "AWS CloudWatch Metrics Helm Chart config"
    aws_cloudwatch_metrics_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    aws_cloudwatch_metrics_irsa_policies = optional(list(string), [])

    # "Enable Fargate FluentBit add-on"
    enable_fargate_fluentbit = optional(bool, false)

    # "Fargate fluentbit add-on config"
    fargate_fluentbit_addon_config = optional(any, {})

    # "Enable Cert Manager add-on"
    enable_cert_manager = optional(bool, false)

    # "Cert Manager Helm Chart config"
    cert_manager_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    cert_manager_irsa_policies = optional(list(string), [])

    # "Domain names of the Route53 hosted zone to use with cert-manager"
    cert_manager_domain_names = optional(list(string), [])

    # "Install Let's Encrypt Cluster Issuers"
    cert_manager_install_letsencrypt_issuers = optional(bool, true)

    # "Email address for expiration emails from Let's Encrypt"
    cert_manager_letsencrypt_email = optional(string, "")

    # "Enable Cert Manager CSI Driver add-on"
    enable_cert_manager_csi_driver = optional(bool, false)

    # "Cert Manager CSI Driver Helm Chart config"
    cert_manager_csi_driver_helm_config = optional(any, {})

    # "list(string) of kubernetes imagePullSecrets"
    cert_manager_kubernetes_svc_image_pull_secrets = optional(list(string), [])

    # "Enable Cert Manager istio-csr add-on"
    enable_cert_manager_istio_csr = optional(bool, false)

    # "Cert Manager Istio CSR Helm Chart config"
    cert_manager_istio_csr_helm_config = optional(any, {})

    # "Enable Argo workflows add-on"
    enable_argo_workflows = optional(bool, false)

    # "Argo workflows Helm Chart config"
    argo_workflows_helm_config = optional(any, null)

    # "Enable Argo Rollouts add-on"
    enable_argo_rollouts = optional(bool, false)

    # "Argo Rollouts Helm Chart config"
    argo_rollouts_helm_config = optional(any, null)

    # "Enable Argo CD Kubernetes add-on"
    enable_argocd = optional(bool, false)

    # "Argo CD Kubernetes add-on config"
    argocd_helm_config = optional(any, {})

    # "Argo CD Applications config to bootstrap the cluster"
    argocd_applications = optional(any, {})

    # "Enable managing add-on configuration via ArgoCD App of Apps"
    argocd_manage_add_ons = optional(bool, false)

    # "Enable AWS Node Termination Handler add-on"
    enable_aws_node_termination_handler = optional(bool, false)

    # "AWS Node Termination Handler Helm Chart config"
    aws_node_termination_handler_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    aws_node_termination_handler_irsa_policies = optional(list(string), [])

    # "Enable Karpenter autoscaler add-on"
    enable_karpenter = optional(bool, false)

    # "Karpenter autoscaler add-on config"
    karpenter_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    karpenter_irsa_policies = optional(list(string), [])

    # "Karpenter Node IAM Instance profile id"
    karpenter_node_iam_instance_profile = optional(string, "")

    # "(Optional) ARN of SQS used by Karpenter when native node termination handling is enabled"
    karpenter_sqs_queue_arn = optional(string, "")

    # "Enable KEDA Event-based autoscaler add-on"
    enable_keda = optional(bool, false)

    # "KEDA Event-based autoscaler add-on config"
    keda_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    keda_irsa_policies = optional(list(string), [])

    # "Enable Kubernetes Dashboard add-on"
    enable_kubernetes_dashboard = optional(bool, false)

    # "Kubernetes Dashboard Helm Chart config"
    kubernetes_dashboard_helm_config = optional(any, null)

    # "Enable HashiCorp Vault add-on"
    enable_vault = optional(bool, false)

    # "HashiCorp Vault Helm Chart config"
    vault_helm_config = optional(any, null)

    # "Enable Vertical Pod Autoscaler add-on"
    enable_vpa = optional(bool, false)

    # "VPA Helm Chart config"
    vpa_helm_config = optional(any, null)

    # "Enable Apache YuniKorn K8s scheduler add-on"
    enable_yunikorn = optional(bool, false)

    # "YuniKorn Helm Chart config"
    yunikorn_helm_config = optional(any, null)

    # "Enable PCA Issuer"
    enable_aws_privateca_issuer = optional(bool, false)

    # "PCA Issuer Helm Chart config"
    aws_privateca_issuer_helm_config = optional(any, {})

    # "ARN of AWS ACM PCA"
    aws_privateca_acmca_arn = optional(string, "")

    # "IAM policy ARNs for AWS ACM PCA IRSA"
    aws_privateca_issuer_irsa_policies = optional(list(string), [])

    # "Enable opentelemetry operator add-on"
    enable_opentelemetry_operator = optional(bool, false)

    # "Opentelemetry Operator Helm Chart config"
    opentelemetry_operator_helm_config = optional(any, {})

    # "Enable Amazon EKS ADOT addon"
    enable_amazon_eks_adot = optional(bool, false)

    # "Configuration for Amazon EKS ADOT add-on"
    amazon_eks_adot_config = optional(any, {})

    # "Enable Kubernetes Dashboard add-on"
    enable_velero = optional(bool, false)

    # "Kubernetes Velero Helm Chart config"
    velero_helm_config = optional(any, null)

    # "IAM policy ARNs for velero IRSA"
    velero_irsa_policies = optional(list(string), [])

    # "Bucket name for velero bucket"
    velero_backup_s3_bucket = optional(string, "")

    # "Enable metrics for JMX workloads"
    enable_adot_collector_java = optional(bool, false)

    # "ADOT Collector Java Helm Chart config"
    adot_collector_java_helm_config = optional(any, {})

    # "Enable metrics for HAProxy workloads"
    enable_adot_collector_haproxy = optional(bool, false)

    # "ADOT Collector HAProxy Helm Chart config"
    adot_collector_haproxy_helm_config = optional(any, {})

    # "Enable metrics for Memcached workloads"
    enable_adot_collector_memcached = optional(bool, false)

    # "ADOT Collector Memcached Helm Chart config"
    adot_collector_memcached_helm_config = optional(any, {})

    # "Enable metrics for Nginx workloads"
    enable_adot_collector_nginx = optional(bool, false)

    # "ADOT Collector Nginx Helm Chart config"
    adot_collector_nginx_helm_config = optional(any, {})

    # "Enable AWS CSI Secrets Store Provider"
    enable_secrets_store_csi_driver_provider_aws = optional(bool, false)

    # "CSI Secrets Store Provider AWS Helm Configurations"
    csi_secrets_store_provider_aws_helm_config = optional(any, null)

    # "Enable CSI Secrets Store Provider"
    enable_secrets_store_csi_driver = optional(bool, false)

    # "CSI Secrets Store Provider Helm Configurations"
    secrets_store_csi_driver_helm_config = optional(any, null)

    # "Enable External Secrets operator add-on"
    enable_external_secrets = optional(bool, false)

    # "External Secrets operator Helm Chart config"
    external_secrets_helm_config = optional(any, {})

    # "Additional IAM policies for a IAM role for service accounts"
    external_secrets_irsa_policies = optional(list(string), [])

    # "List of Systems Manager Parameter ARNs that contain secrets to mount using External Secrets"
    external_secrets_ssm_parameter_arns = optional(list(string), ["arn:aws:ssm:*:*:parameter/*"])

    # "List of Secrets Manager ARNs that contain secrets to mount using External Secrets"
    external_secrets_secrets_manager_arns = optional(list(string), ["arn:aws:secretsmanager:*:*:secret:*"])

    # "Enable Grafana add-on"
    enable_grafana = optional(bool, false)

    # "Kubernetes Grafana Helm Chart config"
    grafana_helm_config = optional(any, null)

    # "IAM policy ARNs for grafana IRSA"
    grafana_irsa_policies = optional(list(string), [])

    # "Enable KubeRay Operator add-on"
    enable_kuberay_operator = optional(bool, false)

    # "KubeRay Operator Helm Chart config"
    kuberay_operator_helm_config = optional(any, {})

    # "Enable Reloader add-on"
    enable_reloader = optional(bool, false)

    # "Reloader Helm Chart config"
    reloader_helm_config = optional(any, {})

    # "Enable Airflow add-on"
    enable_airflow = optional(bool, false)

    # "Apache Airflow v2 Helm Chart config"
    airflow_helm_config = optional(any, {})

    # "Enable Kafka add-on"
    enable_strimzi_kafka_operator = optional(bool, false)

    # "Kafka Strimzi Helm Chart config"
    strimzi_kafka_operator_helm_config = optional(any, {})

    # "Enable Datadog Operator add-on"
    enable_datadog_operator = optional(bool, false)

    # "Datadog Operator Helm Chart config"
    datadog_operator_helm_config = optional(any, {})

    # "Enable Promtail add-on"
    enable_promtail = optional(bool, false)

    # "Promtail Helm Chart config"
    promtail_helm_config = optional(any, {})

    # "Enable Calico add-on"
    enable_calico = optional(bool, false)

    # "Calico add-on config"
    calico_helm_config = optional(any, {})

    # "Enable Kubecost add-on"
    enable_kubecost = optional(bool, false)

    # "Kubecost Helm Chart config"
    kubecost_helm_config = optional(any, {})

    # "Enable Kyverno add-on"
    enable_kyverno = optional(bool, false)

    # "Enable Kyverno policies. Requires `enable_kyverno` to be `true`"
    enable_kyverno_policies = optional(bool, false)

    # "Enable Kyverno UI. Requires `enable_kyverno` to be `true`"
    enable_kyverno_policy_reporter = optional(bool, false)

    # "Kyverno Helm Chart config"
    kyverno_helm_config = optional(any, {})

    # "Kyverno policies Helm Chart config"
    kyverno_policies_helm_config = optional(any, {})

    # "Kyverno UI Helm Chart config"
    kyverno_policy_reporter_helm_config = optional(any, {})

    # "Enable SMB CSI driver add-on"
    enable_smb_csi_driver = optional(bool, false)

    # "SMB CSI driver Helm Chart config"
    smb_csi_driver_helm_config = optional(any, {})

    # "Enable Chaos Mesh add-on"
    enable_chaos_mesh = optional(bool, false)

    # "Chaos Mesh Helm Chart config"
    chaos_mesh_helm_config = optional(any, {})

    # "Enable Cilium add-on"
    enable_cilium = optional(bool, false)

    # "Cilium Helm Chart config"
    cilium_helm_config = optional(any, {})

    # "Enable wiregaurd encryption"
    cilium_enable_wireguard = optional(bool, false)

    # "Enable Gatekeeper add-on"
    enable_gatekeeper = optional(bool, false)

    # "Gatekeeper Helm Chart config"
    gatekeeper_helm_config = optional(any, {})

    # "Enable Kubernetes Dashboard add-on"
    enable_portworx = optional(bool, false)

    # "Kubernetes Portworx Helm Chart config"
    portworx_helm_config = optional(any, null)

    # "Enable Local volume provisioner add-on"
    enable_local_volume_provisioner = optional(bool, false)

    # "Local volume provisioner Helm Chart config"
    local_volume_provisioner_helm_config = optional(any, {})

    # "Enable NVIDIA device plugin add-on"
    enable_nvidia_device_plugin = optional(bool, false)

    # "NVIDIA device plugin Helm Chart config"
    nvidia_device_plugin_helm_config = optional(any, {})

    # "Enable sample app 2048"
    enable_app_2048 = optional(bool, false)

    # "Enable EMR on EKS add-on"
    enable_emr_on_eks = optional(bool, false)

    # "EMR on EKS Helm configuration values"
    emr_on_eks_config = optional(any, {})

    # "Enable consul add-on"
    enable_consul = optional(bool, false)

    # "Consul Helm Chart config"
    consul_helm_config = optional(any, {})

    enable_rabbitmq_cluster_operator = optional(bool, false)

    rabbitmq_cluster_operator_helm_config = optional(any, {})

    enable_redis = optional(bool, false)

    redis_helm_config = optional(any, {})

  })
}

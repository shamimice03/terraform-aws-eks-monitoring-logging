variable "cluster_name" {
  type        = string
  description = "EKS Cluster Name"
  default     = null
}

variable "namespace" {
  type        = string
  description = "Name of namespace"
  default     = null
}

variable "cwagent_configmap_name" {
  type        = string
  description = "Name of the ConfigMap for the CloudWatch Agent"
  default     = "cwagentconfig"
}

variable "cwagent_serviceaccount_manifest_url" {
  type        = string
  description = "URL for the CloudWatch Agent ServiceAccount manifest."
  default     = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-serviceaccount.yaml"
}

variable "cwagent_daemonset_manifest_url" {
  type        = string
  description = "URL for the CloudWatch Agent DaemonSet manifest."
  default     = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-daemonset.yaml"
}
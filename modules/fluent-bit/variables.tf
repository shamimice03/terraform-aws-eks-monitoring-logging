variable "enable_fluent_bit" {
  type        = bool
  description = "Enable or disable cloud watch agent on eks cluster"
  default     = true
}

variable "cluster_name" {
  type        = string
  description = "EKS Cluster Name"
  default     = null
}

variable "aws_region" {
  type    = string
  default = "ap-northeast-1"
}

variable "namespace" {
  type        = string
  description = "Name of namespace"
  default     = null
}

variable "fluentbit_daemonset_manifest_url" {
  type        = string
  description = "URL for the CloudWatch Agent DaemonSet manifest."
  default     = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-daemonset.yaml"
}
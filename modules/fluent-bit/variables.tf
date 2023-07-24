variable "enable_fluent_bit" {
  type        = bool
  description = "Enable or Disable Fluent-bit on eks cluster"
  default     = true
}

variable "cluster_name" {
  type        = string
  description = "EKS Cluster Name"
  default     = null
}

variable "aws_region" {
  type        = string
  description = "Provide Cluster Region"
  default     = null
}

variable "namespace" {
  type        = string
  description = "Name of namespace"
  default     = null
}

variable "fluent_bit_http_server" {
  type        = string
  description = "Enable or Disable fluent bit HTTP server"
  default     = "On"
}

variable "fluent_bit_http_port" {
  type        = string
  description = "Define fluent-bit HTTP Port"
  default     = "2020"
}

variable "fluent_bit_read_head" {
  type        = string
  description = "Enable or Disable fluent-bit Head read"
  default     = "Off"
}

variable "fluent_bit_read_tail" {
  type        = string
  description = "Enable or Disable fluent-bit Tail read"
  default     = "On"
}

variable "fluentbit_configmap_name" {
  type    = string
  default = "fluent-bit-cluster-info"
}

variable "fluentbit_daemonset_manifest_url" {
  type        = string
  description = "URL for the CloudWatch Agent DaemonSet manifest."
  default     = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-daemonset.yaml"
}
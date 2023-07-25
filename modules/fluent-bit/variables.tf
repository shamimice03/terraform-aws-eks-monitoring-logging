variable "cluster_name" {
  type        = string
  description = "EKS Cluster Name. Provide the name of your EKS cluster."
  default     = null
}

variable "aws_region" {
  type        = string
  description = "Provide Cluster Region. Specify the AWS region where the EKS cluster is located."
  default     = null
}

variable "namespace" {
  type        = string
  description = "Name of namespace. Specify the Kubernetes namespace for the deployment."
  default     = null
}

variable "fluent_bit_http_server" {
  type        = string
  description = "Enable or Disable fluent bit HTTP server. Set to 'On' to enable and 'Off' to disable."
  default     = "On"
}

variable "fluent_bit_http_port" {
  type        = string
  description = "Define fluent-bit HTTP Port. Specify the port number for the fluent-bit HTTP server."
  default     = "2020"
}

variable "fluent_bit_read_head" {
  type        = string
  description = "Enable or Disable fluent-bit Head read. Set to 'On' to enable and 'Off' to disable."
  default     = "Off"
}

variable "fluent_bit_read_tail" {
  type        = string
  description = "Enable or Disable fluent-bit Tail read. Set to 'On' to enable and 'Off' to disable."
  default     = "On"
}

variable "fluentbit_configmap_name" {
  type        = string
  description = "Name of the ConfigMap for fluent-bit. Specify the name of the ConfigMap to use."
  default     = "fluent-bit-cluster-info"
}

variable "fluentbit_daemonset_manifest_url" {
  type        = string
  description = "URL for the fluent-bit DaemonSet manifest. Specify the URL for the deployment manifest."
  default     = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/main/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/fluent-bit/fluent-bit.yaml"
}
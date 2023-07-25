# Common variables
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
  description = "Name of the namespace"
  default     = "amazon-cloudwatch"
}

variable "nodegroup_roles" {
  type        = list(any)
  description = "List of EKS nodegroup roles"
  default     = []
}

# Fluent Bit
variable "enable_fluent_bit" {
  type        = bool
  description = "Enable or Disable Fluent-bit Agent on EKS cluster"
  default     = true
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
  type        = string
  description = "Name of the ConfigMap for Fluent Bit"
  default     = "fluent-bit-cluster-info"
}

# CloudWatch Agent (CW Agent)
variable "enable_cwagent" {
  type        = bool
  description = "Enable or Disable CloudWatch Agent on EKS cluster"
  default     = true
}

variable "cwagent_configmap_name" {
  type        = string
  description = "Name of the ConfigMap for CloudWatch Agent"
  default     = "cwagentconfig"
}

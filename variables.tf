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
  default     = "amazon-cloudwatch"
}

variable "enable_fluent_bit" {
  type        = bool
  description = "Enable or Disable Fluent-bit Agent on EKS cluster"
  default     = true
}

variable "enable_cwagent" {
  type        = bool
  description = "Enable or Disable Cloud Watch Agent on EKS cluster"
  default     = true
}

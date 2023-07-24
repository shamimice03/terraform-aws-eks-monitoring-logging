variable "cluster_name" {
  type    = string
  default = "kubecloud-eks-2"
}

variable "aws_region" {
  type    = string
  default = "ap-northeast-1"
}

variable "namespace" {
  type    = string
  default = "amazon-cloudwatch"
}

variable "enable_fluent_bit" {
  type        = bool
  description = "Enable or Disable Fluent-bit on eks cluster"
  default     = true
}

variable "enable_cwagent" {
  type        = bool
  description = "Enable or disable Cloud Watch Agent on eks cluster"
  default     = true
}

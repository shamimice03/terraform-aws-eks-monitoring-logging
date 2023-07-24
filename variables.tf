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

variable "cwagent_configmap_name" {
  type    = string
  default = "cwagentconfig"
} 
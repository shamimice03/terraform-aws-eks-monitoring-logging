###########################################################
# Prerequisite  
# Attach CloudWatchAgentServerPolicy to EKS nodegroup roles
###########################################################
locals {
  cwagent_policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "cwagent_server_policy" {
  count = length(var.nodegroup_roles) > 0 ? length(var.nodegroup_roles) : 0

  policy_arn = local.cwagent_policy_arn
  role       = var.nodegroup_roles[count.index]
}

########################################################
# Create Namespace 
########################################################
resource "kubernetes_namespace_v1" "amazon_cloudwatch" {
  metadata {
    name = var.namespace
  }
}

##################################################################
#     CloudWatch Agent
##################################################################
module "cwagent" {

  count = var.enable_cwagent ? 1 : 0

  source = "./modules/cwagent"

  namespace              = var.namespace
  cluster_name           = var.cluster_name
  cwagent_configmap_name = var.cwagent_configmap_name
}

##################################################################
#     Fluent-Bit
##################################################################
module "fluent_bit" {

  count = var.enable_fluent_bit ? 1 : 0

  source = "./modules/fluent-bit"

  cluster_name             = var.cluster_name
  aws_region               = var.aws_region
  namespace                = var.namespace
  fluent_bit_http_server   = var.fluent_bit_http_server
  fluent_bit_http_port     = var.fluent_bit_http_port
  fluent_bit_read_head     = var.fluent_bit_read_head
  fluent_bit_read_tail     = var.fluent_bit_read_tail
  fluentbit_configmap_name = var.fluentbit_configmap_name
}

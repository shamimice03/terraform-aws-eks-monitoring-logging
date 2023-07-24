########################################################
# Prerequisite - Attach Cloud Watch Agent Server Policy with EKS Nodegroup Role
########################################################

data "aws_iam_role" "nodegroup_role" {
  name = "${var.cluster_name}-kubecloud-eks-nodegroup-public-role"
}

output "nodegroup_role_arn" {
  value = data.aws_iam_role.nodegroup_role.arn
}

resource "aws_iam_role_policy_attachment" "cwa_server_policy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = data.aws_iam_role.nodegroup_role.name
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

  source = "./modules/cwagent"

  enable_cwagent         = true
  namespace              = "amazon-cloudwatch"
  cluster_name           = "kubecloud-eks-2"
  cwagent_configmap_name = "cwagentconfig"

}

##################################################################
#     Fluent-Bit
##################################################################

module "fluent_bit" {

  source = "./modules/fluent-bit"

  enable_fluent_bit = true
  cluster_name      = "kubecloud-eks-2"
  aws_region        = "ap-northeast-1"
  namespace         = "amazon-cloudwatch"
}

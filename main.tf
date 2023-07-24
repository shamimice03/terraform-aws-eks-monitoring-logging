########################################################
# Prerequisite 
########################################################

# Attach Cloud Watch Agent Server Policy with EKS Nodegroup Role

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

resource "kubernetes_namespace_v1" "amazon_cloudwatch" {
  metadata {
    name = var.namespace
  }
}

##################################################################
#     CloudWatch Agent
##################################################################

# Create Service Account, Cluster Role and Cluster Role Binding

resource "kubectl_manifest" "cwagent_serviceaccount" {
  for_each  = data.kubectl_file_documents.cwagent_docs.manifests
  yaml_body = each.value
}

##################################################################
# Create CloudWatch Agent ConfigMap

resource "kubernetes_config_map_v1" "cwagentconfig_configmap" {
  metadata {
    name      = var.cwagent_configmap_name
    namespace = kubernetes_namespace_v1.amazon_cloudwatch.metadata[0].name
  }

  data = {
    "cwagentconfig.json" = file("${path.module}/data/cwagentconfig.json")
  }
}

##################################################################
# Create Deamonset of CWagent

resource "kubectl_manifest" "cwagent_daemonset" {
  depends_on = [
    kubernetes_namespace_v1.amazon_cloudwatch,
    kubernetes_config_map_v1.cwagentconfig_configmap
  ]
  yaml_body = data.http.get_cwagent_daemonset.response_body
}

##################################################################
#     Fluent-Bit
##################################################################
# Create FluentBit Agent ConfigMap

resource "kubernetes_config_map_v1" "fluentbit_configmap" {
  metadata {
    name      = "fluent-bit-cluster-info"
    namespace = kubernetes_namespace_v1.amazon_cloudwatch.metadata[0].name
  }
  data = {
    "cluster.name" = var.cluster_name
    "http.port"    = "2020"
    "http.server"  = "On"
    "logs.region"  = var.aws_region
    "read.head"    = "Off"
    "read.tail"    = "On"
  }
}

##################################################################
# Create FluentBit Agent Deamonset

resource "kubectl_manifest" "fluentbit_resources" {
  depends_on = [
    kubernetes_namespace_v1.amazon_cloudwatch,
    kubernetes_config_map_v1.fluentbit_configmap,
    kubectl_manifest.cwagent_daemonset
  ]
  for_each  = data.kubectl_file_documents.fluentbit_docs.manifests
  yaml_body = each.value
}
################################################
#             CloudWatch Agent
# 
################################################

##################################################################
#     Fluent-Bit
# Datasource: https://github.com/aws-samples/amazon-cloudwatch-container-insights/tree/main/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/fluent-bit
##################################################################

data "http" "get_fluentbit_resources" {
  url = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/fluent-bit/fluent-bit.yaml"
  request_headers = {
    Accept = "text/*"
  }
}

# This provider provides a data resource kubectl_file_documents to enable ease of splitting multi-document yaml content.
data "kubectl_file_documents" "fluentbit_docs" {
  content = data.http.get_fluentbit_resources.response_body
}

##################################################################
#            Fluent Bit Installation
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

  for_each  = data.kubectl_file_documents.fluentbit_docs.manifests
  yaml_body = each.value

  depends_on = [
    kubernetes_config_map_v1.fluentbit_configmap,
  ]
}
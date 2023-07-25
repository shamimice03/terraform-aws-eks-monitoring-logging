# Get Fluent-bit manifests
data "http" "get_fluentbit_resources" {
  url = var.fluentbit_daemonset_manifest_url
  request_headers = {
    Accept = "text/*"
  }
}

# kubectl_file_documents to enable ease of splitting multi-document yaml content.
data "kubectl_file_documents" "fluentbit_docs" {
  content = data.http.get_fluentbit_resources.response_body
}

##################################################################
#            Fluent Bit Installation
##################################################################
# Create FluentBit Agent ConfigMap
resource "kubernetes_config_map_v1" "fluentbit_configmap" {
  metadata {
    name      = var.fluentbit_configmap_name
    namespace = var.namespace
  }
  data = {
    "cluster.name" = var.cluster_name
    "http.port"    = var.fluent_bit_http_port
    "http.server"  = var.fluent_bit_http_server
    "logs.region"  = var.aws_region
    "read.head"    = var.fluent_bit_read_head
    "read.tail"    = var.fluent_bit_read_tail
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
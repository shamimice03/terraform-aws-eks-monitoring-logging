# Get serviceaccount manifest along with cluster role and cluster role binding 
data "http" "get_cwagent_serviceaccount" {
  url = var.cwagent_serviceaccount_manifest_url
  request_headers = {
    Accept = "text/*"
  }
}

# kubectl_file_documents to enable ease of splitting multi-document yaml content
data "kubectl_file_documents" "cwagent_docs" {
  content = data.http.get_cwagent_serviceaccount.response_body
}

# get cwagent manifest - deamonset
data "http" "get_cwagent_daemonset" {
  url = var.cwagent_daemonset_manifest_url
  request_headers = {
    Accept = "text/*"
  }
}

##################################################################
#             CloudWatch Agent Installation
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
    namespace = var.namespace
  }

  data = {
    "cwagentconfig.json" = file("${path.module}/config/cwagentconfig.json")
  }
}

##################################################################
# Create Deamonset of CWagent
resource "kubectl_manifest" "cwagent_daemonset" {

  yaml_body = data.http.get_cwagent_daemonset.response_body

  depends_on = [
    kubernetes_config_map_v1.cwagentconfig_configmap
  ]
}

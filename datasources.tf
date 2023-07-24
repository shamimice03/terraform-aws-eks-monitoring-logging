################################################
#             CloudWatch Agent
# Resource :  https://github.com/aws-samples/amazon-cloudwatch-container-insights/tree/main/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent
################################################

data "http" "get_cwagent_serviceaccount" {
  url = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-serviceaccount.yaml"

  request_headers = {
    Accept = "text/*"
  }
}

# "kubectl_file_documents" to enable ease of splitting multi-document yaml content.
data "kubectl_file_documents" "cwagent_docs" {
  content = data.http.get_cwagent_serviceaccount.response_body
}

data "http" "get_cwagent_daemonset" {
  url = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-daemonset.yaml"
  request_headers = {
    Accept = "text/*"
  }
}


##################################################################
#     Fluent-Bit
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

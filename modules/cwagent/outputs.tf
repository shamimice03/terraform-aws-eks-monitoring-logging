# Output for the CloudWatch Agent Service Account manifest
output "cloudwatch_agent_serviceaccount" {
  value       = kubectl_manifest.cwagent_serviceaccount
  description = "CloudWatch Agent Service Account manifest that includes the required Kubernetes Service Account, Cluster Role, and Cluster Role Binding configurations for the CloudWatch Agent."
}

# Output for the CloudWatch Agent ConfigMap
output "cloudwatch_agent_configmap" {
  value       = kubernetes_config_map_v1.cwagentconfig_configmap
  description = "CloudWatch Agent ConfigMap containing the configuration file 'cwagentconfig.json' that will be used by the CloudWatch Agent DaemonSet."
}

# Output for the CloudWatch Agent DaemonSet manifest
output "cloudwatch_agent_daemonset" {
  value       = kubectl_manifest.cwagent_daemonset
  description = "CloudWatch Agent DaemonSet manifest that defines the deployment of the CloudWatch Agent on each node in the Kubernetes cluster."
}
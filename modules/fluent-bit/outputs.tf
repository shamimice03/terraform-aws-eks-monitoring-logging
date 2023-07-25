# Output for the Fluent Bit ConfigMap
output "fluent_bit_configmap" {
  value       = kubernetes_config_map_v1.fluentbit_configmap
  description = "Fluent Bit ConfigMap containing the configuration options for the Fluent Bit agent."
}

# Output for the Fluent Bit DaemonSet manifest
output "fluent_bit_daemonset" {
  value       = kubectl_manifest.fluentbit_resources
  description = "Fluent Bit DaemonSet manifest that defines the deployment of the Fluent Bit agent on each node in the Kubernetes cluster."
}

# Output for Fluent Bit HTTP server configuration
output "fluent_bit_http_server" {
  value       = var.fluent_bit_http_server
  description = "HTTP server configuration for Fluent Bit, specifying the server to send logs."
}

# Output for Fluent Bit HTTP port configuration
output "fluent_bit_http_port" {
  value       = var.fluent_bit_http_port
  description = "HTTP port configuration for Fluent Bit, specifying the port used for sending logs."
}

# Output for Fluent Bit read head configuration
output "fluent_bit_read_head" {
  value       = var.fluent_bit_read_head
  description = "Fluent Bit read head configuration, specifying the position in the file where Fluent Bit starts to read logs."
}

# Output for Fluent Bit read tail configuration
output "fluent_bit_read_tail" {
  value       = var.fluent_bit_read_tail
  description = "Fluent Bit read tail configuration, specifying the position in the file where Fluent Bit stops reading logs."
}
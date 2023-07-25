# Output for the CloudWatch Agent module
output "cloudwatch_agent_module_enabled" {
  value       = var.enable_cwagent
  description = "Flag indicating if the CloudWatch Agent module is enabled."
}

# Output for the Fluent Bit module
output "fluent_bit_module_enabled" {
  value       = var.enable_fluent_bit
  description = "Flag indicating if the Fluent Bit module is enabled."
}
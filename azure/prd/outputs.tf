output "resource_group_id" {
  description = "Environment resource group ID"
  value       = module.environment.resource_group_id
}

output "resource_group_name" {
  description = "Environment resource group name"
  value       = module.environment.resource_group_name
}

output "virtual_network_id" {
  description = "Environment virtual network resource ID"
  value       = module.environment.virtual_network_id
}

output "virtual_network_name" {
  description = "Environment virtual network name"
  value       = module.environment.virtual_network_name
}

output "apps_subnet_id" {
  description = "Application subnet resource ID"
  value       = module.environment.apps_subnet_id
}
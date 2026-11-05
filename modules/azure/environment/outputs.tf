output "resource_group_id" {
  description = "Environment resource group ID"
  value       = module.resource_group.id
}

output "resource_group_name" {
  description = "Environment resource group name"
  value       = module.resource_group.name
}

output "location" {
  description = "Environment Azure region"
  value       = module.resource_group.location
}

output "virtual_network_id" {
  description = "Environment virtual network resource ID"
  value       = module.virtual_network.virtual_network_id
}

output "virtual_network_name" {
  description = "Environment virtual network name"
  value       = module.virtual_network.virtual_network_name
}

output "apps_subnet_id" {
  description = "Environment application subnet resource ID"
  value       = module.virtual_network.apps_subnet_id
}

output "apps_network_security_group_id" {
  description = "Application network security group resource ID"
  value       = module.virtual_network.apps_network_security_group_id
}

output "apps_route_table_id" {
  description = "Application route table resource ID"
  value       = module.virtual_network.apps_route_table_id
}
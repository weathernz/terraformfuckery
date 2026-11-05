output "virtual_network_id" {
  description = "Virtual network resource ID"
  value       = azurerm_virtual_network.core.id
}

output "virtual_network_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.core.name
}

output "apps_subnet_id" {
  description = "Application subnet resource ID"
  value       = azurerm_subnet.apps.id
}

output "apps_subnet_name" {
  description = "Application subnet name"
  value       = azurerm_subnet.apps.name
}

output "apps_network_security_group_id" {
  description = "Application network security group resource ID"
  value       = azurerm_network_security_group.apps.id
}

output "apps_route_table_id" {
  description = "Application route table resource ID"
  value       = azurerm_route_table.apps.id
}
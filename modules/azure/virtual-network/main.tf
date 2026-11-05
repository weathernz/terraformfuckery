resource "azurerm_virtual_network" "core" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = [var.vnet_address_space]

  tags = var.tags
}
resource "azurerm_network_security_group" "apps" {
  name                = var.apps_nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}
resource "azurerm_route_table" "apps" {
  name                = var.apps_route_table_name
  resource_group_name = var.resource_group_name
  location            = var.location

  route {
    name           = "subnet-local"
    address_prefix = var.apps_subnet_prefix
    next_hop_type  = "VnetLocal"
  }

  tags = var.tags
}

resource "azurerm_subnet" "apps" {
  name                 = var.apps_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.core.name

  address_prefixes                = [var.apps_subnet_prefix]
  default_outbound_access_enabled = false

  delegation {
    name = "Microsoft.Web/serverFarms"

    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }

  private_endpoint_network_policies = "Enabled"

  service_endpoints = [
    "Microsoft.AzureActiveDirectory"
  ]
}
resource "azurerm_subnet_network_security_group_association" "apps" {
  subnet_id                 = azurerm_subnet.apps.id
  network_security_group_id = azurerm_network_security_group.apps.id
}

resource "azurerm_subnet_route_table_association" "apps" {
  subnet_id      = azurerm_subnet.apps.id
  route_table_id = azurerm_route_table.apps.id
}
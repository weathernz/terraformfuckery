resource "time_static" "deployment" {}

locals {
  deployment_date = formatdate("YYYY-MM-DD", time_static.deployment.rfc3339)
  common_tags = merge(
    var.common_tags,
    {
      Environment    = var.environment_name
      DeploymentDate = local.deployment_date
    }
  )
}


resource "azurerm_resource_group" "main" {
  name     = "rg-${var.environment_short}-${var.region_short}-application-01"
  location = var.location

  tags = merge(local.common_tags, {
    "hidden-title" = "Application resources"
  })
}

resource "azurerm_virtual_network" "core" {
  name                = "vnet-${var.environment_short}-${var.region_short}-core-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  address_space = [var.vnet_address_space]

  tags = local.common_tags
}

resource "azurerm_network_security_group" "apps-nsg" {
  name                = "nsg-${var.environment_short}-${var.region_short}-apps-01"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  tags = local.common_tags
}

resource "azurerm_route_table" "apps-rt" {
  name                = "rt-${var.environment_short}-${var.region_short}-apps-01"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  route {
    name           = "subnet-local"
    address_prefix = var.apps_subnet_prefix
    next_hop_type  = "VnetLocal"
  }

  tags = local.common_tags
}

resource "azurerm_subnet" "apps-snet" {
  name                 = "snet-${var.environment_short}-${var.region_short}-apps-01"
  resource_group_name  = azurerm_resource_group.main.name
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
    "AzureActiveDirectory"
  ]

}

resource "azurerm_subnet_network_security_group_association" "apps-nsg-assoc" {
  subnet_id                 = azurerm_subnet.apps-snet.id
  network_security_group_id = azurerm_network_security_group.apps-nsg.id
}

resource "azurerm_subnet_route_table_association" "apps-rt-assoc" {
  subnet_id      = azurerm_subnet.apps-snet.id
  route_table_id = azurerm_route_table.apps-rt.id
}
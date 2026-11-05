resource "time_static" "deployment" {}

locals {
  deployment_date = formatdate(
    "YYYY-MM-DD",
    time_static.deployment.rfc3339
  )

  common_tags = merge(
    var.common_tags,
    {
      Environment    = var.environment_name
      DeploymentDate = local.deployment_date
    }
  )

  resource_group_name   = "rg-${var.environment_short}-${var.region_short}-application-01"
  virtual_network_name  = "vnet-${var.environment_short}-${var.region_short}-core-01"
  apps_nsg_name         = "nsg-${var.environment_short}-${var.region_short}-apps-01"
  apps_route_table_name = "rt-${var.environment_short}-${var.region_short}-apps-01"
  apps_subnet_name      = "snet-${var.environment_short}-${var.region_short}-apps-01"
}

module "resource_group" {
  source = "../resource-group"

  name     = local.resource_group_name
  location = var.location

  tags = merge(
    local.common_tags,
    {
      "hidden-title" = "Application resources"
    }
  )
}

module "virtual_network" {
  source = "../virtual-network"

  virtual_network_name  = local.virtual_network_name
  apps_nsg_name         = local.apps_nsg_name
  apps_route_table_name = local.apps_route_table_name
  apps_subnet_name      = local.apps_subnet_name

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  vnet_address_space = var.vnet_address_space
  apps_subnet_prefix = var.apps_subnet_prefix

  tags = local.common_tags
}
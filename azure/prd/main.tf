module "environment" {
  source = "../../modules/azure/environment"

  environment_name  = var.environment_name
  environment_short = var.environment_short

  location     = var.location
  region_short = var.region_short

  vnet_address_space = var.vnet_address_space
  apps_subnet_prefix = var.apps_subnet_prefix

  common_tags = var.common_tags
}
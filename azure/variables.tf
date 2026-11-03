variable "azure_subscription_id" {
  description = "Azure subscription in which Terraform manages resources"
  type        = string
}

variable "environment_short" {
  description = "Short environment code used in resource names (for example: prd, tst, dev)"
  type        = string
}

variable "environment_name" {
  description = "Display environment name used in tags (for example: Production)"
  type        = string
}

variable "region_short" {
  description = "Short region code used in resource names (for example: nzn)"
  type        = string
}

variable "location" {
  description = "Azure location for all resources"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = string
}

variable "apps_subnet_prefix" {
  description = "Address prefix for the apps subnet and related local route"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to resources"
  type        = map(string)
}
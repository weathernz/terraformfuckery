variable "azure_subscription_id" {
  description = "Azure subscription in which the environment is deployed"
  type        = string
}

variable "environment_name" {
  description = "Long environment name"
  type        = string
}

variable "environment_short" {
  description = "Short environment code"
  type        = string
}

variable "location" {
  description = "Primary Azure region"
  type        = string
}

variable "region_short" {
  description = "Short code for the Azure region"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space assigned to the environment VNet"
  type        = string
}

variable "apps_subnet_prefix" {
  description = "Address prefix assigned to the application subnet"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to environment resources"
  type        = map(string)
  default     = {}
}
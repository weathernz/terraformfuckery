variable "environment_name" {
  description = "Long environment name, such as Development, Test, or Production"
  type        = string
}

variable "environment_short" {
  description = "Short environment code, such as dev, tst, or prd"
  type        = string
}

variable "location" {
  description = "Primary Azure region for the environment"
  type        = string
}

variable "region_short" {
  description = "Short code for the Azure region, such as aue for Australia East"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to resources in the environment"
  type        = map(string)
  default     = {}
}

variable "vnet_address_space" {
  description = "Address space assigned to the environment virtual network"
  type        = string
}

variable "apps_subnet_prefix" {
  description = "Address prefix assigned to the environment application subnet"
  type        = string
}
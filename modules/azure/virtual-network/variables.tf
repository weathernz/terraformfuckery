variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "apps_subnet_name" {
  description = "Name of the application subnet"
  type        = string
}

variable "apps_nsg_name" {
  description = "Name of the application network security group"
  type        = string
}

variable "apps_route_table_name" {
  description = "Name of the application route table"
  type        = string
}

variable "location" {
  description = "Azure region for the networking resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the networking resources"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space assigned to the virtual network"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.vnet_address_space))
    error_message = "vnet_address_space must be a valid IPv4 CIDR, such as 10.10.0.0/16."
  }
}

variable "apps_subnet_prefix" {
  description = "Address prefix assigned to the application subnet"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.apps_subnet_prefix))
    error_message = "apps_subnet_prefix must be a valid IPv4 CIDR, such as 10.10.1.0/24."
  }
}

variable "tags" {
  description = "Tags applied to taggable networking resources"
  type        = map(string)
  default     = {}
}
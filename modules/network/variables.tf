variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_cidr" {
  description = "CIDR block for the VNet/VPC"
  type        = string
}

variable "location" {
  description = "Region where resources will be deployed"
  type        = string
}

variable "resource_group" {
  description = "Resource group name (Azure only)"
  type        = string
}

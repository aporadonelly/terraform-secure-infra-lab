# In modules/compute/variables.tf

variable "resource_group" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location of the resources."
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet."
  type        = string
}


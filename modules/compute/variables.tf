variable "location" {
  description = "Deployment region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where VM will be created"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet for bastion VM"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet for private VM"
  type = string
}
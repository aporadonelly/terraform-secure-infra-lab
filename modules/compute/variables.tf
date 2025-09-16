variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet"
  type        = string
}

variable "location" {
  description = "Deployment region"
  type        = string
}

variable "resource_group" {
  description = "Resource group name (Azure only)"
  type        = string
}

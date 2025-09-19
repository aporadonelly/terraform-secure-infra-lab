variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure location to deploy resources."
  type        = string
}

variable "key_vault_name" {
  description = "The name for the Key Vault."
  type        = string
}

variable "database_password_secret_value" {
  description = "The secret value to store in Key Vault."
  type        = string
  sensitive   = true
}

variable "private_vm_object_id" {
  description = "The Object ID of the private VM's system-assigned managed identity."
  type        = string
}
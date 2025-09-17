# ┌────────────────────────────────────────────┐
# │ Input Variables                            │
# └────────────────────────────────────────────┘

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "rg-terraform-securelab"
}

variable "resource_group_location" {
  description = "Azure region for deployment."
  type        = string
  default     = "westeurope"
  validation {
    condition     = contains(["westeurope", "northeurope", "eastus", "centralus"], var.resource_group_location)
    error_message = "Please choose a valid Azure region."
  }
}

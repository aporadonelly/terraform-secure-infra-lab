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

variable "environment" {
  description = "Environment name (dev/staging/prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "admin_source_ip" {
  description = "Your public IP for SSH/RDP access (format: x.x.x.x/32)"
  type        = string
  sensitive   = true
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "azureadmin"

  validation {
    condition     = length(var.admin_username) > 0 && length(var.admin_username) <= 20
    error_message = "Admin username must be between 1 and 20 characters."
  }
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    ManagedBy  = "Terraform"
    Project    = "SecureInfra"
    CostCenter = "Security"
  }
}
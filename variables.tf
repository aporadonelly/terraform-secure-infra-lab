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


variable "vnet_cidr" {
  description = "CIDR block for the VNET"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "allowed_admin_cidr" {
  description = "Your public IP in CIDR form (e.g., 203.0.113.7/32)"
  type        = string
}

variable "enable_rdp_rule" {
  description = "Allow RDP (3389) from admin IP"
  type        = bool
  default     = false
}

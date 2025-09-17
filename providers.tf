# ┌────────────────────────────────────────────┐
# │ Provider & Backend Configuration           │
# └────────────────────────────────────────────┘

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Optional: Remote state backend
  # backend "azurerm" {
  #   resource_group_name  = "terraform-state-rg"
  #   storage_account_name = "tfstateaccount"
  #   container_name       = "tfstate"
  #   key                  = "secure-infra.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

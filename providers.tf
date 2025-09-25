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
  subscription_id = "439e5b81-a7f9-44cf-a0ab-d6b1eab690ee"
  features {}

  # Disable automatic registration since we don't need all providers
  resource_provider_registrations = "none"
}

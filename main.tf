# Our root configuration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0" # latest major version
    }
  }
}

provider "azurerm" {
  features {}
  #   use_azure_cli = true
}


#Test resource just to see if Terraform and Azure is connected.
resource "azurerm_resource_group" "rg" {
  name     = "rg-secure-infra-lab"
  location = "East US"
}

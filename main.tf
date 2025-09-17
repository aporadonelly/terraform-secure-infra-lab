# ┌────────────────────────────────────────────┐
# │ Root Terraform Configuration - main.tf     │
# └────────────────────────────────────────────┘

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Example module call (to be added later)
# module "network" {
#   source              = "./modules/network"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = var.resource_group_location
#   ...
# }

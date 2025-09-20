# ┌────────────────────────────────────────────┐
# │ Root Terraform Configuration - main.tf     │
# └────────────────────────────────────────────┘

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.resource_group_location

  vnet_cidr           = var.vnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  enable_rdp_rule    = var.enable_rdp_rule
  allowed_admin_cidr = var.allowed_admin_cidr
}

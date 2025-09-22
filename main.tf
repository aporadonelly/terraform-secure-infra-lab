# Root Terraform Configuration - main.tf

# Define the resource group where all resources will be created
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Define a data source to get the current client's configuration
data "azurerm_client_config" "current" {}

# Module to manage network resources (VNet, subnets, etc.)
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.resource_group_location
}

# Module to manage compute resources (VMs, etc.)
module "compute" {
  source            = "./modules/compute"
  location          = var.resource_group_location
  resource_group    = azurerm_resource_group.rg.name
  private_subnet_id = module.network.private_subnet_id
  public_subnet_id  = module.network.public_subnet_id
}

# Module to manage Key Vault resources
module "keyvault" {
  source = "./modules/keyvault"

  kv_name        = "my-secure-infra-keyvault"
  location       = var.resource_group_location
  resource_group = azurerm_resource_group.rg.name
  tenant_id      = data.azurerm_client_config.current.tenant_id
  object_id      = data.azurerm_client_config.current.object_id
}

module "security" {
  source = "./modules/security" # Corrected path
  
  # Required arguments for the security module
  key_vault_name             = module.keyvault.kv_name
  key_vault_id               = module.keyvault.id
  database_password_secret_value = "123456" # Note: Hardcoded values are not recommended
  private_vm_object_id       = module.compute.private_vm_object_id 
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = var.resource_group_location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  object_id                  = data.azurerm_client_config.current.object_id
}




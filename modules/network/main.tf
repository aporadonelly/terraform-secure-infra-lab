# Network Module: creates VNet/VPC, subnets, and NSG rules

#Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-secure-infra-lab"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

//Public Subnet
resource "azurerm_subnet" "public" {
  name                 = "public_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}


#Private subnet
resource "azurerm_subnet" "private" {
  name                 = "private-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

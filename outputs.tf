# ┌────────────────────────────────────────────┐
# │ Output Values                              │
# └────────────────────────────────────────────┘

output "resource_group_name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "The location of the created resource group."
  value       = azurerm_resource_group.rg.location
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}
output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "nsg_public_id" {
  value = module.network.nsg_public_id
}

output "nsg_private_id" {
  value = module.network.nsg_private_id
}

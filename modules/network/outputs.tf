output "vnet_name" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = azurerm_subnet.public.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = azurerm_subnet.private.id
}

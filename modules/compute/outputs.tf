output "bastion_vm_public_ip" {
  description = "Public IP address of the bastion VM"
  value       = azurerm_public_ip.bastion_ip.ip_address
}

output "private_vm_id" {
  description = "The ID of the private VM"
  value = azurerm_linux_virtual_machine.private_vm.id
}
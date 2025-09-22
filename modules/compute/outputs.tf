# In modules/compute/outputs.tf

output "private_vm_object_id" {
  description = "The Object ID of the private VM's managed identity."
  value       = azurerm_linux_virtual_machine.private.identity[0].principal_id
}
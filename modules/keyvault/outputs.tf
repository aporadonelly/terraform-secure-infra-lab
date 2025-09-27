output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = "" # replace with azurerm_key_vault.this.id
}

output "id" {
  value       = azurerm_key_vault.main.id
  description = "The ID of the created Key Vault"
}

output "kv_name" {
  value       = azurerm_key_vault.main.name
  description = "The name of the created Key Vault"
}

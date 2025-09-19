output "key_vault_id" {
  description = "The ID of the provisioned Key Vault."
  value       = azurerm_key_vault.main.id
}
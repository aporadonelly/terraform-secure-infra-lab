resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_key_vault" "main" {
  name                     = var.key_vault_name
  location                 = azurerm_resource_group.main.location
  resource_group_name      = azurerm_resource_group.main.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = "standard"
  soft_delete_retention_days = 7
}

resource "azurerm_key_vault_secret" "database_password" {
  name         = "db-password"
  value        = var.database_password_secret_value
  key_vault_id = azurerm_key_vault.main.id
}

resource "azurerm_key_vault_access_policy" "vm_access" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.private_vm_object_id

  secret_permissions = [
    "Get",
  ]
}
# Key Vault Module: stores SSH key and secrets

resource "azurerm_key_vault" "this" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  # This block is essential for setting permissions.
  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
    ]
  }
}
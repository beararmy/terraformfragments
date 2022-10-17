data "azurerm_key_vault" "main" {
  name                = "kv_name"
  resource_group_name = "kv_rg"
}

data "azurerm_key_vault_secret" "json_build_config" {
  name         = "json_build_config"
  key_vault_id = data.azurerm_key_vault.main.id
}

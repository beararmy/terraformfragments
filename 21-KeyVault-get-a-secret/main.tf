data "azurerm_key_vault_secret" "test" {
  name      = "${var.secret_name}"
  vault_uri = "${var.kv_uri}"
}
output "secret_value" {
  value = "${data.azurerm_key_vault_secret.test.value}"
}

resource "random_string" "password" {
  length = 16
  keepers = {
    keeper1 = "${var.vmname}"
  }
}
resource "azurerm_key_vault_secret" "password" {
  name      = "${var.vmname}${var.username}"
  value     = "${random_string.password.result}"
  vault_uri = "${var.kv_uri}"
}

output "username" {
  value = "${var.username}"
}
output "vmpassword" {
  value = "${azurerm_key_vault_secret.password.value}"
}
output "vmname" {
  value = "${var.vmname}"
}

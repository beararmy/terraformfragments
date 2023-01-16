resource "azurerm_backup_protected_vm" "ext_backup" {
  count               = var.enable_azurebackup == true ? 1 : 0
  backup_policy_id    = join("/", [var.configJSON["rsv_azurebackup_id"], "backupPolicies", var.tags["BackupPolicy"]])
  recovery_vault_name = split("/", var.configJSON["rsv_azurebackup_id"])[8]
  resource_group_name = split("/", var.configJSON["rsv_azurebackup_id"])[4]
  source_vm_id        = azurerm_virtual_machine.main.id
}
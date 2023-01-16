# Configure Azure Backup VM extension from supplied ID and VM Tag

## var.tags["Backup"]

The Value of this tag needs to 100% match the name of an Azure Backup Policy within a given Recovery Services Vault.

## configJSON.rsv_azurebackup_id

`rsv_azurebackup_id` is a JSON element passed in via the `configJSON` variable. Suggested use for this is something like a 'once per subscription' configuration allowing some default values to be easily called from something like a VM TF module.

From the supplied RSV ID we split or join our strings to give us all the values that the terraform resource provides.

## Example resource call

resource "azurerm_backup_protected_vm" "ext_backup" {
  count               = var.enable_azurebackup == true ? 1 : 0
  backup_policy_id    = join("/", [var.configJSON["rsv_azurebackup_id"], "backupPolicies", var.tags["BackupPolicy"]])
  recovery_vault_name = split("/", var.configJSON["rsv_azurebackup_id"])[8]
  resource_group_name = split("/", var.configJSON["rsv_azurebackup_id"])[4]
  source_vm_id        = azurerm_virtual_machine.main.id
}

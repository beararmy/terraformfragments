locals {
  # nonsensitive is only here to allow iteration through the outputs, if it's sensitive for_each won't work
  raw_data = nonsensitive(jsondecode(data.azurerm_key_vault_secret.json_build_config.value))

  # try blocks are there for when there's no returned json element
  this = try(local.raw_data.network_subnet_id, "")
  that = try(local.raw_data.network_subnet_prefix, "")
  them = try(local.raw_data.rsv_backup_policy_id, "")
}

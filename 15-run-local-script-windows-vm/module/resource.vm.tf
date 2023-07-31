resource "azurerm_virtual_machine" "main" {
  name                             = var.vm_name
.........
  dynamic "os_profile" {
    for_each = var.source_vm_disk_id == "" ? [""] : []
    content {
      computer_name  = var.vm_name
      admin_username = "${var.vm_name}-user"
      admin_password = random_password.password.result
      custom_data = file("${path.module}/files/2019-fixer.ps1")
    }
  }

os_profile_windows_config {
      enable_automatic_upgrades = false
      provision_vm_agent        = true
  additional_unattend_config {
    pass = "oobeSystem"
    component = "Microsoft-Windows-Shell-Setup"
    setting_name = "FirstLogonCommands"
    content = file("${path.module}/files/FirstLogonCommands.xml")
  }
}
.........
  tags = var.tags
}

#Discovered today that if you use a SAS token that has a plus in, this will fail.
resource "azurerm_virtual_machine_extension" "CustomExtension" {
  name                 = "${azurerm_virtual_machine.vm.name}-CustomScriptExtension"
  location             = "${var.location}"
  resource_group_name  = "${var.naming_prefix}-rg"
  virtual_machine_name = "${azurerm_virtual_machine.vm.name}"
  type                 = "CustomScriptExtension"
  publisher            = "Microsoft.Compute"
  type_handler_version = "1.9"

  settings = <<SETTINGS
        {   
        "fileUris": [ "https://github.com/folder/script.ps1" ],
        "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File script.ps1"
        }
SETTINGS
}

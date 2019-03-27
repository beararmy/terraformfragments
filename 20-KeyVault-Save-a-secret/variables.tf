variable "vm_name" {
  type        = "string"
  description = "Generic variable for the resource name."
  default     = "test-vm"
}

variable "user_name" {
  type        = "string"
  description = "Use this within the azurerm_virtual_machine resource to set the os_profile/admin_username setting."
  default     = "fake_username"
}

variable "kv_uri" {
  type        = "string"
  description = "URI of KeyVault for Secrets to be saved"
  default     = "https://<yourvaultnamehere>.vault.azure.net/"
}

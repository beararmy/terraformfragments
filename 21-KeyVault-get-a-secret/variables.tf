variable "kv_uri" {
  type        = "string"
  description = "URI of KeyVault for Secrets to be saved"
  default     = "https://<yourvaultnamehere>.vault.azure.net/"
}

variable "secret_name" {
  type        = "string"
  description = "Name of the secret you wish to import"
  default     = "testvalue"
}

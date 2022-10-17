# Used to create a useful error (with free text) when two variables are both supplied at the same time and variable validation is not possible
locals {
  validate_availability_zone = ((var.availability_zone == null ? 0 : var.availability_zone) > 0 && length(var.source_vm_disk_id) > 0) ? tobool("${var.vm_name}: Cannot provide availability_zone and source_vm_disk_id together. Cannot provide AZ to this build method.") : true
}
variable "availability_zone" {
  type        = number
  default     = null
  description = "Azure Availability Zone for VM and disks."
}
variable "source_vm_disk_id" {
  type        = string
  default     = ""
  description = "[OPTIONAL] Migrated Managed Disk to build VM from."
}
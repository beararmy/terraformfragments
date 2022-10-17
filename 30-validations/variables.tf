#Some basic variable validations for copypasta

variable "encryption_selection" {
  type        = string
  default     = "All"
  description = "Default selection of Encrypting All disks on VM. Options are All, OS, Data."
  validation {
    condition     = contains(["All", "OS", "Data"], var.encryption_selection)
    error_message = "Please check for valid options for encryption target."
  }
}

variable "vm_name" {
  type        = string
  description = "Name for VM resources to be deployed with."
  validation {
    condition = (
      length(var.vm_name) < 16
    )
    error_message = "VM Name must be 15 or fewer characters."
  }
}

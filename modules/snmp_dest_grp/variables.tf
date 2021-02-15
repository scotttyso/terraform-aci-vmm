variable "dest_group" {
  description = "Create the SNMP Destination Group: Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group"
  type        = string
  default     = "default_oob"
}

# output "dest_group" {
#   value = aci_rest.snmp_trap_destination_group.id
# }

variable "description" {
  description = "SNMP Destination Group Description."
  type        = string
  default     = ""
  validation {
    condition = (
      length(var.description) >= 0 &&
      length(var.description) <= 128 &&
      can(regexall("[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+", var.description))
    )
    error_message = "The SNMP Destination Group Description can be between 0 ad 128 characters."
  }
}
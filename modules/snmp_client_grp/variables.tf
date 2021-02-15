variable "client_group" {
  description = "SNMP Client Group Name"
  type        = string
  default     = "default_oob"
}

# output "client_group_id" {
#   value = aci_rest.snmp_client_group.id
# }

variable "mgmt" {
  description = "Options are 'inb' or 'oob'.  Define the Management Domain to reach these SNMP Clients"
  type        = string
  default     = "oob"
  validation {
    condition     = (var.mgmt == "inb" || var.mgmt == "oob")
    error_message = "The SNMP Client Group Management Domain must be 'inb' or 'oob'."
  }
}

variable "epg" {
  description = "Define EPG within the Management Domain to reach these SNMP Clients"
  type        = string
  default     = "default"
}
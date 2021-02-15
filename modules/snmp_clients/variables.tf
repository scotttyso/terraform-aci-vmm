variable "client_group" {
  description = "SNMP Client Group Name"
  type        = string
  default     = "default_oob"
}

variable "name" {
  description = "Descriptive Name for the SNMP Client"
  type        = string
  default     = "server1"
}

variable "client" {
  description = "IPv4 or IPv6 Address of the SNMP Client"
  type        = string
  default     = "198.18.1.1"
  validation {
    condition     = (can(regexall("^(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$|[a-fA-F0-9:]+$)", var.client)))
    error_message = "The SNMP Client must be a valid IPv4 or IPv6 Address."
  }
}
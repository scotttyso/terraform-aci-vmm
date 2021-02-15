variable "community" {
  description = "An SNMP Community String.  The community can be between 0 and 32 characters."
  type        = string
  validation {
    condition = (
      length(var.community) >= 1 &&
      length(var.community) <= 32 &&
      can(regexall("^([a-zA-Z0-9\\-\\_\\.]+)$", var.community))
    )
    error_message = "The Community is a Required Parameter and must be between 1 and 32 characters.  This is a Sensitive Parameter."
  }
}

variable "description" {
  description = "SNMP Community Description."
  type        = string
  default     = ""
  validation {
    condition = (
      length(var.description) >= 0 &&
      length(var.description) <= 128 &&
      can(regexall("[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+", var.description))
    )
    error_message = "The Description can be between 0 ad 128 characters."
  }
}
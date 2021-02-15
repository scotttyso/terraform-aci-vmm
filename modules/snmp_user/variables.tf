variable "snmp_user" {
  description = "SNMP User Name."
  type        = string
  sensitive   = true
  validation {
    condition = (
      length(var.snmp_user) >= 1 &&
      length(var.snmp_user) <= 32 &&
      can(regexall("^([a-zA-Z0-9\\-\\_\\.]+)$", var.snmp_user))
    )
    error_message = "The SNMP User is a Required Parameter and must be between 1 and 32 characters."
  }
}

variable "priv_type" {
  description = "Options are (des|None|aes-128)\n - For None leave Blank."
  type        = string
  default     = ""
}

variable "priv_key" {
  description = "Privacy Key.  A string between 8 and 32 Characters.  Optional if not doing Privacy Authentication.  This is a Sensitive Parameter."
  type        = string
  sensitive   = true
  default     = ""
}

variable "auth_type" {
  description = "Authentication Type.  Options are [hmac-sha1-96|None]\n - For None leave Blank.\n - None is the option for md5 based authentication."
  type        = string
  default     = ""
}

variable "auth_key" {
  description = "Authentication Key.  A string between 8 and 32 Characters.  This is a Sensitive Parameter."
  type        = string
  sensitive   = true
  validation {
    condition = (
      length(var.auth_key) >= 8 &&
      length(var.auth_key) <= 32 &&
      can(regexall("^([a-zA-Z0-9\\-\\_\\.]+)$", var.auth_key))
    )
    error_message = "The Authentication Key must be between 8 and 32 characters."
  }
}
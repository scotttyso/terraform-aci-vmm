variable "dest_group" {
  type        = string
  description = "Smart CallHome Destination Group."
  default     = "default"
}

variable "receiver" {
  type        = string
  description = "Smart CallHome Receiver."
  default     = "default"
}

variable "contact_info" {
  type        = string
  description = "Smart CallHome Contact Information."
  default     = "admins@example.com"
}

variable "phone_number" {
  type        = string
  description = "Phone Number for Contact Group."
  default     = "+1 555-555-5555"
}

variable "street_addr" {
  type        = string
  description = "Street Address for APICs Physical Location."
  default     = "One Cisco Way, San Jose, CA 90210"
}

variable "contract_id" {
  type        = string
  description = "Support Contract for ACI Fabric."
  default     = "55555555"
  validation {
    condition = (
      can(regexall("\\d{8}", var.contract_id))
    )
    error_message = "The Smart CallHome Contract ID Must be 8 Digits."
  }
}

variable "customer_id" {
  type        = string
  description = "Customer ID Assigned in the Contract."
  default     = "55555555"
  validation {
    condition = (
      can(regexall("\\d{8}", var.customer_id))
    )
    error_message = "The Smart CallHome Customer ID Must be 8 Digits."
  }
}

variable "site_id" {
  type        = string
  description = "Site ID Assigned in the Contract."
  default     = "55555555"
  validation {
    condition = (
      can(regexall("\\d{8}", var.site_id))
    )
    error_message = "The Smart CallHome Site ID Must be 8 Digits."
  }
}

variable "smtp_relay" {
  type        = string
  description = "SMTP Relay Server"
  default     = "smtp-relay@example.com"
}

variable "smtp_port" {
  type        = number
  description = "SMTP Relay Port"
  default     = 25
  validation {
    condition = (
      var.smtp_port >= 1 &&
      var.smtp_port <= 65535
    )
    error_message = "The Smart CallHome SMTP Relay Port must be between 1 and 65535."
  }
}

variable "from_email" {
  type        = string
  description = "Email Address to use for sending notifications."
  default     = "admins@example.com"
  validation {
    condition = (
      can(regexall("(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$)", var.from_email))
    )
    error_message = "Please Provide a Valid Email Address for the Smart CallHome From Email."
  }
}

variable "reply_email" {
  type        = string
  description = "For Email Notifications Email Address to use for reply."
  default     = "admins@example.com"
  validation {
    condition = (
      can(regexall("(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$)", var.reply_email))
    )
    error_message = "Please Provide a Valid Email Address for the Smart CallHome Reply Email."
  }
}

variable "to_email" {
  type        = string
  description = "For Email Notifications Email Address to send to."
  default     = "admins@example.com"
  validation {
    condition = (
      can(regexall("(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$)", var.to_email))
    )
    error_message = "Please Provide a Valid Email Address for the Smart CallHome To Email."
  }
}

variable "mgmt" {
  type        = string
  description = "(inb|oob) Management Domain."
  default     = "oob"
  validation {
    condition     = (var.mgmt == "inb" || var.mgmt == "oob")
    error_message = "The Smart CallHome Management Domain must be 'inb' or 'oob'."
  }
}

variable "epg" {
  type        = string
  description = "EPG on the Management Domain to use."
  default     = "default"
}
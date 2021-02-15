terraform {
  experiments = [module_variable_optional_attrs]
}

variable "dns_domain" {
  description = "Assigned FQDN and Search Domains.  Assign yes to the fqdn variable only to the FQDN.  Assign no to the rest."
  type = map(object({
    domain = optional(string)
    fqdn   = optional(string)
  }))
  default = {
    default = {
      domain = "example.com"
      fqdn   = "no"
    }
  }
#  validation {
#    condition = (
#      var.dns_domain_default.fqdn == "no" || var.dns_domain_default.fqdn == "yes" &&
#      can(regexall("(?:\\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*", var.dns_domain_default.domain))
#    )
#    error_message = "Please assign a Valid DNS Domain and set the fqdn to either 'yes' or 'no'."
#  }
}

variable "dns_mgmt" {
  description = "Options are 'inb' or 'oob'.  Define the Management Domain to reach the DNS Server(s)."
  type        = string
  default     = "oob"
  validation {
    condition     = (var.dns_mgmt == "inb" || var.dns_mgmt == "oob")
    error_message = "The DNS Management Domain must be 'inb' or 'oob'."
  }
}

variable "dns_epg" {
  description = "What EPG in the Management Domain should be used to reach the DNS Server(s)."
  type        = string
  default     = "default"
}

variable "dns_server" {
  description = "Add DNS Servers for domain resolution.  You can configure a maximum of two servers.  Only one can be preferred 'true'."
  type = map(object({
    preferred = optional(bool)
    server    = optional(string)
  }))
  default = {
    default = {
      preferred = false
      server    = "198.18.1.1"
    }
  }
#  validation {
#    condition = (
#      var.dns_server["preferred"] == true || var.dns_server["preferred"] == false &&
#      can(regexall("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", var.dns_server["server"]))
#    )
#    error_message = "The DNS Server must be a valid IPv4 Address.  And preferred should be true or false."
#  }
}

locals {
  dns_domain = {
    for k, v in var.dns_domain : k => {
      domain = coalesce(v.domain, "example.com")
      fqdn = coalesce(v.fqdn, "no")
    }
  }
  dns_server = {
    for k, v in var.dns_server : k => {
      preferred = coalesce(v.preferred, false)
      server = coalesce(v.server, "198.18.1.1")
    }
  }
}
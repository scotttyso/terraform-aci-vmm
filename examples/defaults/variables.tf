variable "community1" {
  type      = string
  sensitive = true
}

variable "snmp_user1" {
  type      = string
  sensitive = true
}

variable "auth_key1" {
  type      = string
  sensitive = true
}

variable "aciUser" {
  description = "If using a Domain with the User Remember to add apic#[domain]\\<username>"
  type        = string
}

variable "aciPass" {
  description = "NEVER Store your USERNAME or PASSWORD in a Public Repository"
  type        = string
  sensitive   = true
}

variable "aciUrl" {
  description = "This can be the IP or Hostname of the ACI Host you will be configuring"
  type        = string
  default     = "https://brahma-apic1.rich.ciscolabs.com"
}
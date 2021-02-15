variable "dest_group" {
  description = "SNMP Trap Destination Group Name.  This should have already been created by the 'snmp_dest_grp' module"
  type        = string
  default     = "default_oob"
}

variable "snmp_source" {
  description = "Create a SNMP Source under Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP"
  type        = string
  default     = "default_oob"
}

variable "snmp_messages" {
  description = "Options are [none|all|audit|events|faults|session].  Best Practice; recommendation, 'audit,events,faults'.  APIC default is 'all'.  Which Message Types to include with the SNMP Source."
  type        = string
  default     = "audit,events,faults"
  validation {
    condition = (
      var.snmp_messages == "" || can(regexall("(all|audit|events|faults|session|[a-z,]+)", var.snmp_messages))
    )
    error_message = "The SNMP Messages options are [none|all|audit|events|faults|session] or a comma seperated combination."
  }
}
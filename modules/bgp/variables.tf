terraform {
  experiments = [module_variable_optional_attrs]
}

variable "bgp_asn" {
  description = "Assign the BGP Autonomous System Number to the System."
  type        = number
  default     = 65001
  validation {
    condition = (
      var.bgp_asn >= 1 &&
      var.bgp_asn <= 4294967295
    )
    error_message = "The BGP ASN must be between 1 and 4294967295."
  }
}

variable "bgp_rr" {
  description = "Assign the Spines in the Fabric that should be configured as BGP Route Reflectors.  Typically this should be all spines."
  type = map(object({
    node_id = optional(number)
  }))
  default = {
    default = {
      node_id = 101
    }
  }
#  validation {
#    condition = (
#      var.bgp_rr["node_id"] >= 101 &&
#      var.bgp_rr["node_id"] <= 4001
#    )
#    error_message = "For the BGP Route Reflector, the Node ID Must be between 101 and 4001."
#  }
}

locals {
  bgp_rr = {
    for k, v in var.bgp_rr : k => {
      node_id = coalesce(v.node_id, 101)
    }
  }
}
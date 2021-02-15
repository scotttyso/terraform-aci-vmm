# snmp_client_grp - SNMP Client Group Terraform Module - aci_rest

## Usage

```hcl
module "snmp_client_grp" {

  source = "terraform-aci-fabric//modules/snmp_client_grp"

  # omitted...
}
```

This module will Create a SNMP Client Group in the default SNMP Policy.

These resources are created:

* [SNMP Client Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "snmpClientGrpP"
* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}"

GUI Location:

SNMP Client Group:

* Fabric > Fabric Policies > Policies > Pod > SNMP > default - Client Group Policies

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | > 0.14 |
| aci | >= 0.5.2 |

## Providers

| Name | Version |
|------|---------|
| aci | >= 0.5.2 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_group | SNMP Client Group Name | `string` | `"default_oob"` | no |
| epg | Define EPG within the Management Domain to reach these SNMP Clients | `string` | `"default"` | no |
| mgmt | Options are 'inb' or 'oob'.  Define the Management Domain to reach these SNMP Clients | `string` | `"oob"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
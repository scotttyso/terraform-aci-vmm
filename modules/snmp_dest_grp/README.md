# snmp_dest_grp - SNMP Trap Destination Group Terraform Module - aci_rest

## Usage

```hcl
module "snmp_dest_grp" {

  source = "terraform-aci//modules/snmp_dest_grp"

  # omitted...
}
```

This module will Create a SNMP Trap Destination Group.

These resources are created

* [SNMP Destination Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "snmpGroup"
* Distinguished Name: "uni/fabric/snmpgroup-{SNMP Trap Destination Group}"

GUI Location:

SNMP Destination Group:

* Admin > External Data Collectors > Monitoring Destinations > SNMP > {SNMP Trap Destination Group}

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
| description | SNMP Destination Group Description. | `string` | `""` | no |
| dest\_group | Create the SNMP Destination Group: Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group | `string` | `"default_oob"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
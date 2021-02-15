# snmp_clients - SNMP Clients Terraform Module - aci_rest

## Usage

```hcl
module "snmp_clients" {

  source = "terraform-aci-fabric//modules/snmp_clients"

  # omitted...
}
```

This module will Add SNMP Clients to a SNMP Client Group in the default SNMP Policy.

These resources are created:

* [SNMP Clients](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "snmpClientP"
* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}/client-[SNMP_Client]"

GUI Location:

* Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: {Client Group Name} > Client Entries

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
| client | IPv4 or IPv6 Address of the SNMP Client | `string` | `"198.18.1.1"` | no |
| client\_group | SNMP Client Group Name | `string` | `"default_oob"` | no |
| name | Descriptive Name for the SNMP Client | `string` | `"server1"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# snmp_community - SNMP Community Terraform Module - aci_rest

## Usage

```hcl
module "snmp_community" {

  source = "terraform-aci-fabric//modules/snmp_community"

  # omitted...
}
```

This module will Add SNMP Communities to the default SNMP Policy.

These resources are created:

* [SNMP Communities](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "snmpCommunityP"
* Distinguished Name: "uni/fabric/snmppol-default/community-{SNMP Community}"

GUI Location:

* Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies

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
| community | An SNMP Community String.  The community can be between 0 and 32 characters. | `string` | n/a | yes |
| description | SNMP Community Description. | `string` | `""` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
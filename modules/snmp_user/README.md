# snmp_user - SNMP User Terraform Module - aci_rest

## Usage

```hcl
module "snmp_user" {

  source = "terraform-aci-fabric//modules/snmp_user"

  # omitted...
}
```

This module will Add SNMP Users in the default SNMP Policy.

These resources are created:

* [SNMP User](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "snmpUserP"
* Distinguished Name: "uni/fabric/snmppol-default/user-{SNMP_User}"

GUI Location:

* Fabric > Fabric Policies > Policies > Pod > SNMP > default: SNMP V3 Users

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
| auth\_key | Authentication Key.  A string between 8 and 32 Characters.  This is a Sensitive Parameter. | `string` | n/a | yes |
| auth\_type | Authentication Type.  Options are [hmac-sha1-96\|None]<br> - For None leave Blank.<br> - None is the option for md5 based authentication. | `string` | `""` | no |
| priv\_key | Privacy Key.  A string between 8 and 32 Characters.  Optional if not doing Privacy Authentication.  This is a Sensitive Parameter. | `string` | `""` | no |
| priv\_type | Options are (des\|None\|aes-128)<br> - For None leave Blank. | `string` | `""` | no |
| snmp\_user | SNMP User Name. | `string` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
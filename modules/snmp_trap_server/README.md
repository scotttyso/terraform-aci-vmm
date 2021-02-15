# snmp_trap_server - SNMP Trap Server Terraform Module - aci_rest

## Usage

```hcl
module "snmp_trap_server" {

  source = "terraform-aci//modules/snmp_trap_server"

  # omitted...
}
```

This module will deploy the recommended Fabric characteristics for the Fabric Policy Configuration.

These resources are created

* [SNMP Trap Server](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

SNMP Trap Forward Destination:

* Class: "snmpTrapFwdServerP"
* Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[{Trap Server}]"

SNMP Trap Destination:

* Class: "snmpTrapDest"
* Distinguished Name: "uni/fabric/snmpgroup-{SNMP Destination Group}/trapdest-{SNMP Trap Server}-port-{SNMP Port}"

GUI Location:

SNMP Trap Forward Destination:

* Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers

SNMP Trap Destination:

* Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group: Trap Servers

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
| dest\_group | SNMP Trap Destination Group Name.  This should have already been created by the 'snmp\_dest\_grp' module | `string` | `"default_oob"` | no |
| epg | Define EPG within the Management Domain to reach this SNMP Trap Server | `string` | `"default"` | no |
| mgmt | Options are 'inb' or 'oob'.  Define the Management Domain to reach this SNMP Trap Server | `string` | `"oob"` | no |
| security\_level | Options are (auth\|noauth\|priv)<br> - auth: Authentication and no privacy<br> - noauth: Default.  No authentication and no privacy.<br> - priv: Authentication and privacy | `string` | `"noauth"` | no |
| snmp\_port | Port for the SNMP Trap Server.  Default is 162 | `number` | `162` | no |
| snmp\_server | IPv4 or IPv6 Address of the SNMP Trap Server | `string` | `"198.18.1.1"` | no |
| snmp\_string | SNMP User or SNMP Community for authenticating to the SNMP Trap Server.  This is a Sensitive Parameter. | `string` | n/a | yes |
| snmp\_version | Options are (v1\|v2c\|v3).  Version 3 would be for SNMP User | `string` | `"v2c"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
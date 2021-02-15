# snmp_trap_source - SNMP Trap Source Terraform Module - aci_rest

## Usage

```hcl
module "snmp_trap_source" {

  source = "terraform-aci//modules/snmp_trap_source"

  # omitted...
}
```

This module will Create a SNMP Trap Source.

These resources are created

* [SNMP Trap Source](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "snmpSrc"
* Distinguished Name: "uni/fabric/moncommon/snmpsrc-{Source Name}"

GUI Location:

SNMP Source:

* Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP

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
| snmp\_messages | Options are [none\|all\|audit\|events\|faults\|session].  Best Practice; recommendation, 'audit,events,faults'.  APIC default is 'all'.  Which Message Types to include with the SNMP Source. | `string` | `"audit,events,faults"` | no |
| snmp\_source | Create a SNMP Source under Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP | `string` | `"default_oob"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
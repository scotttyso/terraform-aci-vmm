# syslog_source - Syslog Source Terraform Module - aci_rest

## Usage

```hcl
module "syslog_source" {

  source = "terraform-aci-fabric//modules/syslog_source"

  # omitted...
}
```

This module will Create a Syslog Source in the Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source.

These resources are created:

* [Syslog Source](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "syslogSrc"
* Distinguished Name: "uni/fabric/moncommon/slsrc-{Syslog Source Name}"

GUI Location:

* Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source


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
| dest\_group | Syslog Destination Group Name.  This should have already been created by the 'syslog\_dest\_grp' module | `string` | `"default_oob"` | no |
| incl\_types | Options are (None\|all\|audit\|events\|faults\|session).  Default is faults.  We recommend 'alerts,faults,events,session' or 'all', same result. | `string` | `"alerts,faults,events,session"` | no |
| min\_level | Options are (emergencies\|alerts\|critical\|errors\|warnings\|notifications\|information\|debugging).  Default is warnings.  Best practice is information. | `string` | `"information"` | no |
| source\_grp | Syslog Source Group Name.  Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source. | `string` | `"default_oob"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
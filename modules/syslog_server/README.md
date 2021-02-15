# syslog_server - Syslog Server Terraform Module - aci_rest

## Usage

```hcl
module "syslog_server" {

  source = "terraform-aci-fabric//modules/syslog_server"

  # omitted...
}
```

This module will Create a Syslog Remote Destinationp in the External Data Collectors > Monitoring Destinations > Syslog.

These resources are created:

* [Syslog Remote Destination](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "syslogRemoteDest"
* Distinguished Name: "uni/tn-mgmt/mgmtp-default/{Mgmt_Domain}-{Mgmt_EPG}"

GUI Location:

* Admin > External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name} > Create Syslog Remote Destination

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
| dest\_group | Syslog Destination Group Name.  This should have already been created by the 'syslog\_dest\_grp' module. | `string` | `"default_oob"` | no |
| epg | Define EPG within the Management Domain to reach this Remote Syslog Server. | `string` | `"default"` | no |
| facility | Options are (local[0-7]).  Default is local7. | `string` | `"local7"` | no |
| mgmt | Options are 'inb' or 'oob'.  Define the Management Domain to reach this Remote Syslog Server. | `string` | `"oob"` | no |
| syslog\_name | A Descriptive Name for the Syslog Remote Destination. | `string` | `"default_oob"` | no |
| syslog\_port | Default port for Syslog is 514. | `number` | `514` | no |
| syslog\_server | IPv4 or IPv6 Address for the Syslog Remote Server. | `string` | `"198.18.1.1"` | no |
| syslog\_severity | Options are (emergencies\|alerts\|critical\|errors\|warnings\|notifications\|information\|debugging).  Default is warnings.  Best practice is information. | `string` | `"information"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
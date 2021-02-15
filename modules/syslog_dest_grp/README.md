# syslog_dest_grp - Syslog Destination Group Terraform Module - aci_rest

## Usage

```hcl
module "syslog_dest_grp" {

  source = "terraform-aci-fabric//modules/syslog_dest_grp"

  # omitted...
}
```

This module will Create a Syslog Destination Group in the External Data Collectors > Monitoring Destinations > Syslog.

These resources are created:

* [Syslog Destination Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "syslogGroup"
* Distinguished Name: "uni/fabric/slgroup-{Destination Group Name}"

GUI Location:

* Admin > External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name}

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
| console\_sev | Options are (emergencies\|alerts\|critical).  Set the console logging level. | `string` | `"critical"` | no |
| console\_state | Options are (enabled\|disabled).  Enable or disable console logging on the switches. | `string` | `"enabled"` | no |
| description | Syslog Destination Group Description. | `string` | `""` | no |
| dest\_group | Create the Syslog Destination Group: External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name}. | `string` | `"default_oob"` | no |
| incl\_msec | Options are (true\|false).  Include msec in the log timestamp. | `bool` | `true` | no |
| local\_sev | Options are (emergencies\|alerts\|critical\|errors\|warnings\|notifications\|information\|debugging).  Set the local logging level. | `string` | `"information"` | no |
| local\_state | Options are [enabled\|disabled].  Enable or disable console logging on the switches. | `string` | `"enabled"` | no |
| log\_format | Options are (aci\|nxos).  Default is aci.  Choose whether you want the logs to be sent in NX-OS format or ACI Format. | `string` | `"aci"` | no |
| timezone | Options are (true\|false).  Include the local time zone in the log timestamp. | `bool` | `true` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
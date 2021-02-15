# smart_callhome - Smart CallHome Terraform Module - aci_rest

## Usage

```hcl
module "smart_callhome" {

  source = "terraform-aci-fabric//modules/smart_callhome"

  # omitted...
}
```

This module will Configure the Smart CallHome Policies for the ACI Fabric.

These resources are created:

* [Smart CallHome](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

Smart CallHome Destination Group:

* Class: "callhomeSmartGroup"
* Distinguished Name: "uni/fabric/smartgroup-{Smart CallHome Destination Group}"

Smart CallHome Source:

* Class: "callhomeSmartSrc"
* Distinguished Name: "uni/infra/moninfra-default/smartchsrc"

GUI Location:

Smart CallHome Destination Group:

* Admin > External Data Collectors > Monitoring Destinations > Smart Callhome > [Smart CallHome Destination Group]

Smart CallHome Source:

* Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Smart CallHome Source

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
| contact\_info | Smart CallHome Contact Information. | `string` | `"admins@example.com"` | no |
| contract\_id | Support Contract for ACI Fabric. | `string` | `"55555555"` | no |
| customer\_id | Customer ID Assigned in the Contract. | `string` | `"55555555"` | no |
| dest\_group | Smart CallHome Destination Group. | `string` | `"default"` | no |
| epg | EPG on the Management Domain to use. | `string` | `"default"` | no |
| from\_email | Email Address to use for sending notifications. | `string` | `"admins@example.com"` | no |
| mgmt | (inb\|oob) Management Domain. | `string` | `"oob"` | no |
| phone\_number | Phone Number for Contact Group. | `string` | `"+1 555-555-5555"` | no |
| receiver | Smart CallHome Receiver. | `string` | `"default"` | no |
| reply\_email | For Email Notifications Email Address to use for reply. | `string` | `"admins@example.com"` | no |
| site\_id | Site ID Assigned in the Contract. | `string` | `"55555555"` | no |
| smtp\_port | SMTP Relay Port | `number` | `25` | no |
| smtp\_relay | SMTP Relay Server | `string` | `"smtp-relay@example.com"` | no |
| street\_addr | Street Address for APICs Physical Location. | `string` | `"One Cisco Way, San Jose, CA 90210"` | no |
| to\_email | For Email Notifications Email Address to send to. | `string` | `"admins@example.com"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
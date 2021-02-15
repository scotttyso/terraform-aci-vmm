# ntp - Terraform Module to Assign NTP Servers to ACI - aci_rest

## Usage

```hcl
module "ntp" {

  source = "terraform-aci-fabric//modules/ntp"

  # omitted...
}
```

This module will Add NTP Servers to the default Date and Time Policy.

These resources are created:

* [ntp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "datetimeNtpProv"
* Distinguished Name: "uni/fabric/time-default/ntpprov-{NTP_Server}"

GUI Location:

* Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers

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
| ntp | Top Level ntp variable to work around default variable merger... The real Variable holder is 'ntp\_default'. | `string` | `""` | no |
| ntp\_default | Deploy NTP Servers for Time and Date Policies. Only one server can be preferred (true). | <pre>object({<br>    epg        = string<br>    mgmt       = string<br>    ntp_server = string<br>    preferred  = bool<br>  })</pre> | <pre>{<br>  "epg": "default",<br>  "mgmt": "oob",<br>  "ntp_server": "198.18.1.1",<br>  "preferred": false<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
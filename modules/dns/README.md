# dns - Add DNS Domains and Servers for APIC/switch domain resolution Terraform Module - aci_rest

## Usage

```hcl
module "dns" {

  source = "terraform-aci-fabric//modules/dns"

  # omitted...
}
```

This module will Add Search domains and the FQDN, then add DNS Servers for Fabric FQDN resolution.

These resources are created:

* [dns](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

FQDN and Search Domains:

* Class: "dnsDomain"
* Distinguished Name: "uni/fabric/dnsp-default/dom-[{Domain}]"

DNS Management Domain:

* Class: "dnsRsProfileToEpg"
* Distinguished Name: "uni/tn-mgmt/mgmtp-default/{Mgmt_Domain}-{EPG}"

DNS Server:

* Class: "dnsProv"
* Distinguished Name: "uni/fabric/dnsp-default/prov-[{DNS_Server}]"

GUI Location:

FQDN and Search Domains:

* Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains

DNS Management Domain:

* Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: Management EPG

DNS Server:

* Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers

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
| dns\_domain | Top Level dns\_domain variable to work around default variable merger... The real Variable holder is 'dns\_domain\_default'. | `string` | `""` | no |
| dns\_domain\_default | Assigned FQDN and Search Domains.  Assign yes to the fqdn variable only to the FQDN.  Assign no to the rest. | <pre>object({<br>    domain = string<br>    fqdn   = string<br>  })</pre> | <pre>{<br>  "domain": "example.com",<br>  "fqdn": "no"<br>}</pre> | no |
| dns\_epg | What EPG in the Management Domain should be used to reach the DNS Server(s). | `string` | `"default"` | no |
| dns\_mgmt | Options are 'inb' or 'oob'.  Define the Management Domain to reach the DNS Server(s). | `string` | `"oob"` | no |
| dns\_server | Top Level dns\_domain variable to work around default variable merger... The real Variable holder is 'dns\_server\_default'. | `string` | `""` | no |
| dns\_server\_default | Add DNS Servers for domain resolution.  You can configure a maximum of two servers.  Only one can be preferred 'true'. | <pre>object({<br>    preferred = bool<br>    server    = string<br>  })</pre> | <pre>{<br>  "preferred": false,<br>  "server": "198.18.1.1"<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
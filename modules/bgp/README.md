# bgp - BGP Configuration Terraform Module - aci_rest

## Usage

```hcl
module "bgp" {

  source = "terraform-aci-fabric//modules/bgp"

  # omitted...
}
```

This module will Configure the BGP ASN and add the Route Reflectors for the ACI Fabric.

These resources are created:

* [BGP ASN](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)
* [BGP Route Reflectors](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

BGP Autonomous System Number:

* Class: "bgpAsP"
* Distinguished Name: "uni/fabric/bgpInstP-default"

BGP Route Reflectors:

* Class: "bgpRRNodePEp"
* Distinguished Name: "uni/fabric/bgpInstP-default/rr/node-{Node ID}"

GUI Location:

BGP Autonomous System Number:

* System > System Settings > BGP Route Reflector: Autonomous System Number

BGP Route Reflectors:

* System > System Settings > BGP Route Reflector: Route Reflector Nodes

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
| bgp\_asn | Assign the BGP Autonomous System Number to the System. | `number` | `65001` | no |
| bgp\_rr | Top Level bgp\_rr variable to work around default variable merger... The real Variable holder is 'bgp\_rr\_default'. | `string` | `""` | no |
| bgp\_rr\_default | Assign the Spines in the Fabric that should be configured as BGP Route Reflectors.  Typically this should be all spines. | <pre>object({<br>    node_id = number<br>  })</pre> | <pre>{<br>  "node_id": 101<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
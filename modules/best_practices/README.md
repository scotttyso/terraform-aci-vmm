# best_practices - Fabric Recommended Settings Terraform Module - aci_rest

## Usage

```hcl
module "best_practices" {

  source = "terraform-aci-fabric//modules/best_practices"

  # omitted...
}
```

This module will configure the recommended Best practice settings for the ACI Fabric.

These resources modified:

API Information:

Fabric Settings Classes:

* Class: "coopPol"
* Class: "fabricNodeControl"
* Class: "isisDomPol"
* Class: "l3IfPol"

Fabric Settings Distinguished Names:

* Distinguished Name: "uni/fabric"
* Distinguished Name: "uni/fabric/pol-default"
* Distinguished Name: "uni/fabric/nodecontrol-default"
* Distinguished Name: "uni/fabric/isisDomP-default"
* Distinguished Name: "uni/fabric/l3IfP-default"

Infrastructure Settings Classes:

* Class: "infraSetPol"
* Class: "epLoopProtectP"
* Class: "epControlP"
* Class: "epIpAgingP"
* Class: "infraPortTrackPol"
* Class: "mcpInstPol"
* Class: "qosInstPol"

Infrastructure Settings Distinguished Names:

* Distinguished Name: "uni/infra/settings"
* Distinguished Name: "uni/infra/epLoopProtectP-default"
* Distinguished Name: "uni/infra/epCtrlP-default"
* Distinguished Name: "uni/infra/ipAgingP-default"
* Distinguished Name: "uni/infra/trackEqptFabP-default"
* Distinguished Name: "uni/infra/mcpInstP-default"
* Distinguished Name: "uni/infra/qosinst-default"

GUI Location:

Fabric Settings:

Assign the Preferred Mgmt Domain for Routing on the APICs:

* System > System Settings > APIC Connectivity Preferences

Enable Strict COOP Group Policy:

* System > System Settings > COOP Group

Telemetry & Enable DOM:

* Fabric > Policies > Monitoring > Fabric Node Controls > default

ISIS Metric for redistributed Routes - 63:

* System > System Settings > ISIS Policy

Enable BFD for Fabric-Facing Interfaces:

* Fabric > Fabric Policies > Policies > L3 Interface > default > BFD ISIS Policy

Infrastructure Settings:

Fabric Wide Settings

* System > System Settings > Fabric Wide Settings
  Disable Remote EP Learning
  Enforce Subnet Check
  Turn on Domain Validation

Endpoint Controls

* System > System Settings > Endpoint Controls
  Endpoint Loop Protection - Enabled - recommended
  Rouge Endpoint Control - Enabled - recommended
  * Interval 30 seconds - recommended
  * Multiplier 6 - recommended
  * action - no actions is the default recommendation
  IP Aging - Enabled

Infrastructure Port Tracking - Enabled:

* System > System Settings > Port Tracking

Mis-Cabling Protocol per-vlan Tracking:

* Fabric > Access Policies > Global Policies > MCP Instance Policy default.

Preserve COS through the ACI Fabric:

* Fabric > Access Policies > Policies > Global > QOS Class > Preserve COS

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
| disable\_remote\_ep\_learn | Options are (true\|false), to disable remote endpoint learning in VRFs containing external bridged/routed domains | `string` | `true` | no |
| domain\_validation | Options are (true\|false).  Best Practice true.  APIC default false.  Validation check if a static path is added but no domain is associated to an EPG | `bool` | `true` | no |
| ep\_loop\_action | (port-disable\|bd-learn-disable).  To enable both use 'port-disable,bd-learn-disable'.  Best practice is to have no actions AKA ''.  APIC default is 'port-disable'.  on can be:  BD Learn Disable or Port Disable. | `string` | `""` | no |
| ep\_loop\_state | Enable or Disable, (enabled\|disabled), endpoint loop protection state.  The endpoint loop protection policy specifies how loops detected by frequent MAC moves are handled | `string` | `"enabled"` | no |
| fabric\_bfd | Options are (enabled\|disabled). Best Practice is enabled.  APIC default disabled.  This setting will configure BFD for the Fabric Interfaces. | `string` | `"enabled"` | no |
| fabric\_bfd\_descr | Description for the Fabric BFD Policy | `string` | `"Fabric BFD Policy"` | no |
| fabric\_coop\_policy | Options are [strict\|compatible].  Best Practice is strict.  APIC default is compatible.  COOP protocol is enhanced to support two ZMQ authentication modes:  Compatible Type—COOP accepts both MD5 authenticated and non-authenticated ZMQ connections for message transportation. Note:  The APIC provides a managed object (fabric:SecurityToken), that includes an attribute to be used for the MD5 password. An attribute in this managed object, called 'token', is a string that changes every hour. COOP obtains the notification from the DME to update the password for ZMQ authentication. The attribute token value is not displayed.  Strict Type—COOP allows MD5 authenticated ZMQ connections only. | `string` | `"strict"` | no |
| fabric\_dom\_descr | Description for Digital Optical Monitoring | `string` | `"Enable Digital Optical Monitoring with 1 to Monitor optical interface statistics"` | no |
| fabric\_isis\_metric | Best Practice is 63.  The ISIS Redistribuation Metric can be between 1 and 63.  We recommend the other default policies remain as configured | `number` | `63` | no |
| fabric\_mgmt\_preference | Options are (inband\|ooband).  Prefer Inband or Out-of-Band for routing Mgmt traffic.  default is inband. Majority of customers set to ooband, thus the default value. | `string` | `"ooband"` | no |
| fabric\_node\_dom | Options are (enabled [1]\| disabled [0]).  Best Practice is 1.  APIC default is 0.  Digital Optical Monitoring (DOM) for an optical physical interface. | `number` | `1` | no |
| fabric\_node\_feature | Options are (analytics\|netflow\|telemetry). Best Practice is telemetry.  APIC default is telemetry.  This will set which engine will be enabled on the switches for sending information.  Telemetry is what is required by all the day 2 operaitons tools for Streaming Telemetry.  Analytics is for Tetration analytics | `string` | `"telemetry"` | no |
| ip\_aging\_state | Options are (enabled\|disabled).  Best Practice enabled.  APIC default is disabled.  When enabled, the IP aging policy ages unused IPs on an endpoint. | `string` | `"enabled"` | no |
| mcp\_control | Options are (pdu-per-vlan\|none).  Best Practice pdu-per-vlan.  APIC default is none ''.  MCP per VLAN will send the message frames on each VLAN. | `string` | `"pdu-per-vlan"` | no |
| mcp\_description | Description for the MCP Instance Policy default | `string` | `"Configured using Terraform ACI Provider Deployment Script"` | no |
| mcp\_key | The key or password to uniquely identify the MCP packets within this fabric. | `string` | `"cisco"` | no |
| mcp\_state | Options are (enabled\|disabled).  Best Practice enabled.  APIC default is disabled.  The administrative state of the MCP instance policy. | `string` | `"enabled"` | no |
| port\_tracking | Options are (on\|off).  Best Practice on.  APIC default is off.  The port tracking policy monitors the status of links between leaf switches and spine switches. When an enabled port tracking policy is triggered, the leaf switches take down all access interfaces on the switch that have EPGs deployed on them. | `string` | `"on"` | no |
| preserve\_cos | Options are (dot1p-preserve\|none).  Best Practice is 'dot1p-preserve'.  APIC default is none, ''.  enable or disable CoS Preservation, to guarantee the QoS priority settings of the various traffic streams, in a single-pod topology. In multipod topologies, use a DSCP policy to enable preserving QoS priority mapping for the traffic streams as they transit the inter-pod network. | `string` | `"dot1p-preserve"` | no |
| rouge\_interval | Best Practice is 30.  APIC default is 60.  Sets the Rogue EP detection interval, which specifies the time to detect rogue endpoints. Valid values are from 0 to 65535 seconds. | `number` | `30` | no |
| rouge\_multiplier | Best Practice is 6.  APIC default is 4.  Sets the Rogue EP Detection multiplication factor for determining if an endpoint is unauthorized. If the endpoint moves more times than this number, within the EP detection interval, the endpoint is declared rogue. Valid values are from 2 to 10. | `number` | `6` | no |
| rouge\_state | (enabled\|disabled).  Best Practice enabled.  APIC default is disabled.  A rogue endpoint can attack top of rack (ToR) switches through frequently, repeatedly injecting packets on different ToR ports and changing 802.1Q tags (emulating endpoint moves), resulting in learned sclass and EPG port changes. Misconfigurations can also cause frequent IP and MAC addresss changes (moves) | `string` | `"enabled"` | no |
| subnet\_check | Options are (true\|false).  Best Practice true.  APIC default false.  To Restrict IP address learning the the configured subnets in a VRF, for all VRFs | `bool` | `true` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
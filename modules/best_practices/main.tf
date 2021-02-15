/*
Assign Best Practice Values for the Fabric Settings

API Information:
 - Class: "coopPol"
 - Class: "fabricNodeControl"
 - Class: "isisDomPol"
 - Class: "l3IfPol"
 - Distinguished Name: "uni/fabric"
 - Distinguished Name: "uni/fabric/pol-default"
 - Distinguished Name: "uni/fabric/nodecontrol-default"
 - Distinguished Name: "uni/fabric/isisDomP-default"
 - Distinguished Name: "uni/fabric/l3IfP-default"
GUI Location:
Assign the Preferred Mgmt Domain for Routing on the APICs
 - System > System Settings > APIC Connectivity Preferences
Enable Strict COOP Group Policy
 - System > System Settings > COOP Group
Telemetry & Enable DOM
   Fabric > Policies > Monitoring > Fabric Node Controls > default
ISIS Metric for redistributed Routes - 63
   System > System Settings > ISIS Policy
Enable BFD for Fabric-Facing Interfaces 
   Fabric > Fabric Policies > Policies > L3 Interface > default > BFD ISIS Policy
*/
resource "aci_rest" "fabric_best_practice" {
  path       = "/api/node/mo/uni/fabric.json"
  class_name = "fabricInst"
  payload    = <<EOF
{
    "fabricInst": {
        "attributes": {
            "dn": "uni/fabric"
        },
        "children": [
			{
				"mgmtConnectivityPrefs": {
					"attributes": {
						"dn": "uni/fabric/connectivityPrefs",
						"interfacePref": "${var.fabric_mgmt_preference}"
					},
					"children": []
				}
			},
			{
				"coopPol": {
					"attributes": {
						"dn": "uni/fabric/pol-default",
						"type": "${var.fabric_coop_policy}"
					},
					"children": []
				}
			},
			{
				"fabricNodeControl": {
					"attributes": {
						"dn": "uni/fabric/nodecontrol-default",
						"control": "${var.fabric_node_dom}",
						"descr": "${var.fabric_dom_descr}",
						"featureSet": "${var.fabric_node_feature}"
					},
					"children": []
				}
			},
            {
                "isisDomPol": {
                    "attributes": {
                        "dn": "uni/fabric/isisDomP-default",
                        "redistribMetric": "${var.fabric_isis_metric}"
					},
					"children": []
				}
			},
			{
				"l3IfPol": {
					"attributes": {
						"dn": "uni/fabric/l3IfP-default",
						"bfdIsis": "${var.fabric_bfd}",
						"descr": "${var.fabric_bfd_descr}"
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}

/*
Assign Best Practice Values for the Infrastructure Settings
API Information:
 - Class: "infraSetPol"
 - Class: "epLoopProtectP"
 - Class: "epControlP"
 - Class: "epIpAgingP"
 - Class: "infraPortTrackPol"
 - Class: "mcpInstPol"
 - Class: "qosInstPol"
 - Distinguished Name: "uni/infra/settings"
 - Distinguished Name: "uni/infra/epLoopProtectP-default"
 - Distinguished Name: "uni/infra/epCtrlP-default"
 - Distinguished Name: "uni/infra/ipAgingP-default"
 - Distinguished Name: "uni/infra/trackEqptFabP-default"
 - Distinguished Name: "uni/infra/mcpInstP-default"
 - Distinguished Name: "uni/infra/qosinst-default"
GUI Location:
Fabric Wide Settings
 - System > System Settings > Fabric Wide Settings
   Disable Remote EP Learning
   Enforce Subnet Check
   Turn on Domain Validation
Endpoint Controls
 - System > System Settings > Endpoint Controls
   Endpoint Loop Protection - Enabled - recommended
   Rouge Endpoint Control - Enabled - recommended
	- Interval 30 seconds - recommended
	- Multiplier 6 - recommended
	- action - no actions is the default recommendation
   IP Aging - Enabled
Infrastructure Port Tracking - Enabled
 - System > System Settings > Port Tracking
Mis-Cabling Protocol per-vlan Tracking 
 - Fabric > Access Policies > Global Policies > MCP Instance Policy default.
Preserve COS through the ACI Fabric
 - Fabric > Access Policies > Policies > Global > QOS Class > Preserve COS

*/
resource "aci_rest" "infra_best_practice" {
  path       = "/api/node/mo/uni/infra.json"
  class_name = "infraInfra"
  payload    = <<EOF
{
	"infraInfra": {
		"attributes": {
			"dn": "uni/infra",
		},
		"children": [
			{
				"infraSetPol": {
					"attributes": {
						"dn": "uni/infra/settings",
						"domainValidation": "${var.domain_validation}",
						"enforceSubnetCheck": "${var.subnet_check}",
						"unicastXrEpLearnDisable": "${var.disable_remote_ep_learn}"
					},
					"children": []
				}
			},
			{
				"epLoopProtectP": {
					"attributes": {
						"dn": "uni/infra/epLoopProtectP-default",
						"adminSt": "${var.ep_loop_state}",
						"action": "${var.ep_loop_action}",
					},
					"children": []
				}
			},
			{
				"epControlP": {
					"attributes": {
						"dn": "uni/infra/epCtrlP-default",
						"adminSt": "${var.rouge_state}",
						"rogueEpDetectIntvl": "${var.rouge_interval}",
						"rogueEpDetectMult": "${var.rouge_multiplier}",
					},
					"children": []
				}
			},
			{
				"epIpAgingP": {
					"attributes": {
						"dn": "uni/infra/ipAgingP-default",
						"adminSt": "${var.ip_aging_state}"
					},
					"children": []
				}
			},
			{
				"infraPortTrackPol": {
					"attributes": {
						"dn": "uni/infra/trackEqptFabP-default",
						"adminSt": "${var.port_tracking}"
					},
					"children": []
				}
			},
			{
				"mcpInstPol": {
					"attributes": {
						"dn": "uni/infra/mcpInstP-default",
						"descr": "${var.mcp_description}",
						"ctrl": "${var.mcp_control}",
						"adminSt": "${var.mcp_state}",
						"key": "${var.mcp_key}"
					},
					"children": []
				}
			},
			{
				"qosInstPol": {
					"attributes": {
						"dn": "uni/infra/qosinst-default",
						"ctrl": "${var.preserve_cos}"
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}
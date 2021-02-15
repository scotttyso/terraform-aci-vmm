/*
API Information:
 - Class: "fabricPodPGrp"
 - Distinguished Name: "uni/fabric/funcprof/podpgrp-default"
GUI Location:
 - Fabric > Fabric Policies > Pods > Policy Groups: default
 - Assign all the default Policies to this Policy Group
*/
resource "aci_rest" "Pod_Policy_Group" {
  path       = "/api/node/mo/uni/fabric/funcprof/podpgrp-${var.pod_pgrp}.json"
  class_name = "fabricPodPGrp"
  payload    = <<EOF
{
	"fabricPodPGrp": {
		"attributes": {
			"dn": "uni/fabric/funcprof/podpgrp-${var.pod_pgrp}",
			"name": "${var.pod_pgrp}",
			"descr": "${var.Description}",
			"rn": "podpgrp-${var.pod_pgrp}"
		},
		"children": [
			{
				"fabricRsTimePol": {
					"attributes": {
						"tnDatetimePolName": "${var.date_time}"
					},
					"children": []
				}
			},
			{
				"fabricRsPodPGrpIsisDomP": {
					"attributes": {
						"tnIsisDomPolName": "${var.isis_policy}"
					},
					"children": []
				}
			},
			{
				"fabricRsPodPGrpCoopP": {
					"attributes": {
						"tnCoopPolName": "${var.coop_policy}"
					},
					"children": []
				}
			},
			{
				"fabricRsPodPGrpBGPRRP": {
					"attributes": {
						"tnBgpInstPolName": "${var.bgp_policy}"
					},
					"children": []
				}
			},
			{
				"fabricRsCommPol": {
					"attributes": {
						"tnCommPolName": "${var.mgmt_policy}"
					},
					"children": []
				}
			},
			{
				"fabricRsSnmpPol": {
					"attributes": {
						"tnSnmpPolName": "${var.snmp_policy}"
					},
					"children": []
				}
			},
			{
				"fabricRsMacsecPol": {
					"attributes": {
						"tnMacsecFabIfPolName": "${var.macsec_policy}"
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
Assign the Pod Policy Group - default - to the default Pod Profile
API Information:
 - Class: "fabricRsPodPGrp"
 - Distinguished Name: "uni/fabric/funcprof/podpgrp-default"
GUI Location:
 - Fabric > Fabric Policies > Pods > Profiles > Pod Profile default
 - Assign Pod Policy Group to the Profile
*/
resource "aci_rest" "fabricRsPodPGrp" {
  path       = "/api/node/mo/uni/fabric/podprof-default/pods-default-typ-ALL/rspodPGrp.json"
  class_name = "fabricRsPodPGrp"
  payload    = <<EOF
{
	"fabricRsPodPGrp": {
		"attributes": {
			"tDn": "uni/fabric/funcprof/podpgrp-${var.pod_pgrp}",
			"status": "created"
		},
		"children": []
	}
}
	EOF
}
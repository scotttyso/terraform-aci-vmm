/*
API Information:
 - Class: "snmpClientGrpP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default - Client Group Policies
*/
resource "aci_rest" "snmp_client_group" {
  path       = "/api/node/mo/uni/fabric/snmppol-default/clgrp-${var.client_group}.json"
  class_name = "snmpClientGrpP"
  payload    = <<EOF
{
	"snmpClientGrpP": {
		"attributes": {
			"dn": "uni/fabric/snmppol-default/clgrp-${var.client_group}",
			"name": "${var.client_group}",
			"descr": "SNMP Clients allowed on Mgmt ${var.mgmt} EPG ${var.epg}",
			"status": "created"
		},
		"children": [
			{
				"snmpRsEpg": {
					"attributes": {
						"tDn": "uni/tn-mgmt/mgmtp-default/${var.mgmt}-${var.epg}",
						"status": "created"
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}
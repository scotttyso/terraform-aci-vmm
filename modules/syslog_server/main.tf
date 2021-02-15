/*
API Information:
 - Class: "syslogRemoteDest"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/{Mgmt_Domain}-{Mgmt_EPG}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name} > Create Syslog Remote Destination
*/
resource "aci_rest" "syslog_server" {
  path       = "/api/node/mo/uni/fabric/slgroup-${var.dest_group}/rdst-${var.syslog_server}.json"
  class_name = "syslogRemoteDest"
  payload    = <<EOF
{
	"syslogRemoteDest": {
		"attributes": {
			"dn": "uni/fabric/slgroup-default/rdst-${var.syslog_server}",
			"host": "${var.syslog_server}",
			"name": "${var.syslog_name}",
			"forwardingFacility": "${var.facility}",
			"port": "${var.syslog_port}",
			"severity": "${var.syslog_severity}",
		},
		"children": [
			{
				"fileRsARemoteHostToEpg": {
					"attributes": {
						"tDn": "uni/tn-mgmt/mgmtp-default/${var.mgmt}-${var.epg}"
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}
/*
API Information:
 - Class: "syslogSrc"
 - Distinguished Name: "uni/fabric/moncommon/slsrc-{Syslog Source Name}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source
*/
resource "aci_rest" "syslog_source" {
  path       = "/api/node/mo/uni/fabric/moncommon/slsrc-${var.source_grp}.json"
  class_name = "syslogSrc"
  payload    = <<EOF
{
	"syslogSrc": {
		"attributes": {
			"dn": "uni/fabric/moncommon/slsrc-${var.source_grp}",
			"name": "${var.source_grp}",
			"incl": "${var.incl_types}",
            "minSev": "${var.min_level}",
		},
		"children": [
			{
				"syslogRsDestGroup": {
					"attributes": {
						"tDn": "uni/fabric/slgroup-${var.dest_group}",
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}
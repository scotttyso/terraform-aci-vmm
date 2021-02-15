/*
SNMP Trap Source
API Information:
 - Class: "snmpSrc"
 - Distinguished Name: "uni/fabric/moncommon/snmpsrc-{Source Name}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP
 - Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group
*/
resource "aci_rest" "snmp_trap_source" {
  path       = "/api/node/mo/uni/fabric/moncommon/snmpsrc-${var.snmp_source}.json"
  class_name = "snmpSrc"
  payload    = <<EOF
{
	"snmpSrc": {
		"attributes": {
			"dn": "uni/fabric/moncommon/snmpsrc-${var.snmp_source}",
			"incl": "${var.snmp_messages}",
			"name": "${var.snmp_source}",
		},
		"children": [
			{
				"snmpRsDestGroup": {
					"attributes": {
						"tDn": "uni/fabric/snmpgroup-${var.dest_group}",
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}
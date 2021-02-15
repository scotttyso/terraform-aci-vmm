/*
API Information:
 - Class: "syslogGroup"
 - Distinguished Name: "uni/fabric/slgroup-{Destination Group Name}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name}
*/
resource "aci_rest" "syslog_destination_group" {
  path       = "/api/node/mo/uni/fabric/slgroup-${var.dest_group}.json"
  class_name = "syslogGroup"
  payload    = <<EOF
{
	"syslogGroup": {
		"attributes": {
			"dn": "uni/fabric/slgroup-${var.dest_group}",
			"name": "${var.dest_group}",
			"descr": ""${var.description}",
            "format": "${var.log_format}",
			"includeMilliSeconds": "${var.incl_msec}",
			"includeTimeZone": "${var.timezone}"
		},
		"children": [
			{
				"syslogConsole": {
					"attributes": {
						"dn": "uni/fabric/slgroup-${var.dest_group}/console",
                        "adminState": "${var.console_state}",
                        "severity": "${var.console_sev}"
					},
					"children": []
				}
			},
			{
				"syslogFile": {
					"attributes": {
						"dn": "uni/fabric/slgroup-${var.dest_group}/file",
                        "adminState": "${var.local_state}",
                        "severity": "${var.local_sev}"
					},
					"children": []
				}
			},
			{
				"syslogProf": {
					"attributes": {
						"dn": "uni/fabric/slgroup-${var.dest_group}/prof",
						"rn": "prof"
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}
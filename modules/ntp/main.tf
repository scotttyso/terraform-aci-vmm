/*
API Information:
 - Class: "datetimeNtpProv"
 - Distinguished Name: "uni/fabric/time-default/ntpprov-{NTP_Server}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers
*/
resource "aci_rest" "ntp" {
  for_each   = local.ntp
  path       = "/api/node/mo/uni/fabric/time-default/ntpprov-${each.value["ntp_server"]}.json"
  class_name = "datetimeNtpProv"
  payload    = <<EOF
{
    "datetimeNtpProv": {
        "attributes": {
            "dn": "uni/fabric/time-default/ntpprov-${each.value["ntp_server"]}",
            "name": "${each.value["ntp_server"]}",
            "preferred": "${each.value["preferred"]}"
        },
        "children": [
            {
                "datetimeRsNtpProvToEpg": {
                    "attributes": {
                        "tDn": "uni/tn-mgmt/mgmtp-default/${each.value["mgmt"]}-${each.value["epg"]}"
                    }
                }
            }
        ]
    }
}
	EOF
}
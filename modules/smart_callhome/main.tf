/*
API Information:
 - Class: "callhomeSmartGroup"
 - Distinguished Name: "uni/fabric/smartgroup-{Smart CallHome Destination Group}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Smart Callhome > [Smart CallHome Destination Group]
*/
resource "aci_rest" "SmartCallHome_destGrp" {
  path       = "/api/node/mo/uni/fabric/smartgroup-${var.dest_group}.json"
  class_name = "callhomeSmartGroup"
  payload    = <<EOF
{
    "callhomeSmartGroup": {
        "attributes": {
            "dn": "uni/fabric/smartgroup-${var.dest_group}",
            "name": "${var.dest_group}",
        },
        "children": [
            {
                "callhomeProf": {
                    "attributes": {
                        "dn": "uni/fabric/smartgroup-${var.dest_group}/prof",
                        "port": "${var.smtp_port}",
                        "from": "${var.from_email}",
                        "replyTo": "${var.reply_email}",
                        "email": "${var.to_email}",
                        "phone": "${var.phone_number}",
                        "contact": "${var.contact_info}",
                        "addr": "${var.street_addr}",
                        "contract": "${var.contract_id}",
                        "customer": "${var.customer_id}",
                        "site": "${var.site_id}"
                    },
                    "children": [
                        {
                            "callhomeSmtpServer": {
                                "attributes": {
                                    "dn": "uni/fabric/smartgroup-${var.dest_group}/prof/smtp",
                                    "host": "${var.smtp_relay}"
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
                    ]
                }
            },
            {
                "callhomeSmartDest": {
                    "attributes": {
                        "dn": "uni/fabric/smartgroup-${var.dest_group}/smartdest-${var.receiver}",
                        "name": "${var.receiver}",
                        "email": "${var.reply_email}",
                        "format": "short-txt"
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
API Information:
 - Class: "callhomeSmartSrc"
 - Distinguished Name: "uni/infra/moninfra-default/smartchsrc"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Smart CallHome Source
*/
resource "aci_rest" "SmartCallHome_Src" {
  path       = "/api/node/mo/uni/infra/moninfra-default/smartchsrc.json"
  class_name = "callhomeSmartSrc"
  payload    = <<EOF
{
    "callhomeSmartSrc": {
        "attributes": {
            "dn": "uni/infra/moninfra-default/smartchsrc",
        },
        "children": [
            {
                "callhomeRsSmartdestGroup": {
                    "attributes": {
                        "tDn": "uni/fabric/smartgroup-${var.dest_group}"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}
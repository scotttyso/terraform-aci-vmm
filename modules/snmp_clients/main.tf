/*
API Information:
 - Class: "snmpClientP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}/client-[SNMP_Client]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: {Client Group Name} > Client Entries
*/
resource "aci_rest" "snmp_client" {
  path       = "/api/node/mo/uni/fabric/snmppol-default/clgrp-${var.client_group}_Clients/client-[${var.client}].json"
  class_name = "snmpClientP"
  payload    = <<EOF
{
    "snmpClientP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/clgrp-${var.client_group}/client-[${var.client}]",
            "name": "${var.name}",
            "addr": "${var.client}",
        },
        "children": []
    }
}
	EOF
}
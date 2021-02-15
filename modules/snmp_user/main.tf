/*
API Information:
 - Class: "snmpUserP"
 - Distinguished Name: "uni/fabric/snmppol-default/user-{SNMP_User}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: SNMP V3 Users
*/
resource "aci_rest" "snmp_users" {
  path       = "/api/node/mo/uni/fabric/snmppol-default/user-${var.snmp_user}.json"
  class_name = "snmpUserP"
  payload    = <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-${var.snmp_user}",
            "name": "${var.snmp_user}",
            "privType": "${var.priv_type}",
            "privKey": "${var.priv_key}",
            "authType": "${var.auth_type}",
            "authKey": "${var.auth_key}"
        },
        "children": []
    }
}
	EOF
}
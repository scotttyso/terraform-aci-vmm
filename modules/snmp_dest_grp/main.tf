/*
API Information:
 - Class: "snmpGroup"
 - Distinguished Name: "uni/fabric/snmpgroup-{Destination Group}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > SNMP > {Destination Group}
*/
resource "aci_rest" "snmp_trap_destination_group" {
  path       = "/api/node/mo/uni/fabric/snmpgroup-${var.dest_group}.json"
  class_name = "snmpGroup"
  payload    = <<EOF
{
    "snmpGroup": {
        "attributes": {
            "dn": "uni/fabric/snmpgroup-${var.dest_group}",
            "descr": "${var.description}",
            "name": "${var.dest_group}"
        },
        "children": []
    }
}
	EOF
}
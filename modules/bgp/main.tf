/*
API Information:
 - Class: "bgpAsP"
 - Distinguished Name: "uni/fabric/bgpInstP-default"
GUI Location:
 - System > System Settings > BGP Route Reflector: Autonomous System Number
*/
resource "aci_rest" "bgp_asn" {
  path       = "/api/node/mo/uni/fabric/bgpInstP-default/as.json"
  class_name = "bgpAsP"
  payload    = <<EOF
{
    "bgpAsP": {
        "attributes": {
            "dn": "uni/fabric/bgpInstP-default/as",
            "asn": "${var.bgp_asn}",
        },
        "children": []
    }
}
	EOF
}

/*
API Information:
 - Class: "bgpRRNodePEp"
 - Distinguished Name: "uni/fabric/bgpInstP-default/rr/node-{Node ID}"
GUI Location:
 - System > System Settings > BGP Route Reflector: Route Reflector Nodes
*/
resource "aci_rest" "bgp_rr" {
  for_each   = local.bgp_rr
  path       = "/api/node/mo/uni/fabric/bgpInstP-default/rr/node-${each.value["node_id"]}.json"
  class_name = "bgpRRNodePEp"
  payload    = <<EOF
{
    "bgpRRNodePEp": {
        "attributes": {
            "dn": "uni/fabric/bgpInstP-default/rr/node-${each.value["node_id"]}",
            "id": "${each.value["node_id"]}",
        },
        "children": []
    }
}
	EOF
}
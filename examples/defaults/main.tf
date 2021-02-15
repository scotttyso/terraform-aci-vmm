module "fabric_best_practices" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/best_practices"
  version = "0.0.5"
}

module "fabric_bgp" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/bgp"
  version = "0.0.5"
  bgp_asn = 65002
  bgp_rr = {
    "spine101" = {
      node_id = 101
    },
    "spine102" = {
      node_id = 102
    }
  }
}

module "fabric_dns" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/dns"
  version = "0.0.5"
}

module "fabric_ntp" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/ntp"
  version = "0.0.5"
}

module "fabric_pod_policy" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/pod_policy"
  version = "0.0.5"
}

module "fabric_smart_callhome" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/smart_callhome"
  version = "0.0.5"
}

module "fabric_snmp_client_grp" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_client_grp"
  version = "0.0.5"
}

module "fabric_snmp_clients" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_clients"
  version = "0.0.5"
}

module "fabric_snmp_community" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_community"
  version = "0.0.5"
  # insert required variables here
  community = var.secure_community1
}

module "fabric_snmp_dest_grp" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_dest_grp"
  version = "0.0.5"
}

module "fabric_snmp_trap_source" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_trap_source"
  version = "0.0.5"
}

module "fabric_snmp_trap_server" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_trap_server"
  version = "0.0.5"
  # insert required variables here
  snmp_string = var.community1
}

module "fabric_snmp_user" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_user"
  version = "0.0.5"
  # insert required variables here
  auth_key  = var.auth_key1
  snmp_user = var.snmp_user1
}

module "fabric_syslog_dest_grp" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/syslog_dest_grp"
  version = "0.0.5"
}

module "fabric_syslog_source" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/syslog_source"
  version = "0.0.5"
}

module "fabric_syslog_server" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/syslog_server"
  version = "0.0.5"
}
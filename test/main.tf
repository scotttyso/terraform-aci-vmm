module "fabric_best_practices" {
  source  = "../modules/best_practices"
}

module "fabric_bgp" {
  source  = "../modules/bgp"
  bgp_asn = 65002
  bgp_rr = {
    # Because the only variable is node_id I need to configure even the default here as the loop would overwrite the default
    "spine101" = {
      node_id = "101"
    },
    "spine102" = {
      node_id = "102"
    }
  }
}

module "fabric_dns" {
  source  = "../modules/dns"
  # The default "oob" mgmt Domain is being used here so there is no need for: 
  # dns_mgmt  = "oob"
  dns_domain = {
    "dmz_domain" = {
      domain = "dmz.example.com"
      # The default setting for fqdn is "no", I can accept that without adding it here
    },
    "prod_domain" = {
      domain = "prod.example.com"
      fqdn   = "yes"
    }
  }
  dns_server = {
    "dns_server1" = {
      preferred = true
      # The default server is 198.18.1.1 so I am accepting it here.
    },
    "dns_server2" = {
      # The default setting for preferred is "false", I can accept that without adding it here
      server    = "198.18.1.2"
    }
  }
}

module "fabric_ntp" {
  source  = "../modules/ntp"
  # The default "oob" mgmt Domain is being used here so there is no need for: 
  # dns_mgmt  = "oob"
  ntp = {
    "ntp_server1" = {
      # The default setting for epg is "default", I can accept that without adding it here
      # The default setting for mgmt is "oob", I can accept that without adding it here
      preferred = true
      # The default server is 198.18.1.1 so I am accepting it here.
    },
    "ntp_server2" = {
      # The default setting for preferred is "false", I can accept that without adding it here
      ntp_server = "198.18.1.2"
    }
  }
}

module "fabric_pod_policy" {
  source  = "../modules/pod_policy"
}

module "fabric_smart_callhome" {
  source       = "../modules/smart_callhome"
  contact_info = "admin-group@example.com"
  phone_number = "+1 408-555-5555"
  street_addr  = "Two Cisco Way, San Jose, CA 90210"
  contract_id  = "44444444"
  customer_id  = "44444444"
  site_id      = "44444444"
  smtp_relay   = "smtp2@example.com"
  # Using the Default smtp_port of 25
  from_email  = "admin-group@example.com"
  reply_email = "admin-group@example.com"
  to_email    = "admin-group@example.com"
  # Using the Default Management Domain of "oob"
  # Using the Default oob EPG of "default"
}

module "fabric_snmp_client_grp" {
  source  = "../modules/snmp_client_grp"
}

module "fabric_snmp_client1" {
  source  = "../modules/snmp_clients"
}

module "fabric_snmp_client2" {
  source  = "../modules/snmp_clients"
  # Using the default client_group
  name   = "server2"
  client = "198.18.1.2"
}

module "fabric_snmp_community1" {
  source  = "../modules/snmp_community"
  # insert required variables here
  community = var.community1
}

module "fabric_snmp_community2" {
  source  = "../modules/snmp_community"
  # insert required variables here
  community = var.community2
}

module "fabric_snmp_dest_grp" {
  source  = "../modules/snmp_dest_grp"
}

module "fabric_snmp_trap_source" {
  source        = "../modules/snmp_trap_source"
  snmp_messages = "all"
}

module "fabric_snmp_trap_server1" {
  source  = "../modules/snmp_trap_server"
  # insert required variables here
  snmp_string = var.community1
}

module "fabric_snmp_trap_server2" {
  source  = "../modules/snmp_trap_server"
  # insert required variables here
  snmp_server  = "198.18.1.2"
  snmp_string  = var.snmp_user2
  snmp_version = "v3"
}

module "fabric_snmp_user1" {
  source  = "../modules/snmp_user"
  # insert required variables here
  auth_key  = var.auth_key1
  snmp_user = var.snmp_user1
}

module "fabric_snmp_user2" {
  source  = "../modules/snmp_user"
  # insert required variables here
  auth_key  = var.auth_key2
  auth_type = "hmac-sha1-96"
  priv_key  = var.priv_key2
  priv_type = "aes-128"
  snmp_user = var.snmp_user2
}

module "fabric_syslog_dest_grp" {
  source  = "../modules/syslog_dest_grp"
}

module "fabric_syslog_source" {
  source  = "../modules/syslog_source"
}

module "fabric_syslog_server1" {
  source  = "../modules/syslog_server"
}

module "fabric_syslog_server2" {
  source  = "../modules/syslog_server"
  # Accepting the Same defaults as server1 except the IP of the destination
  syslog_server = "198.18.1.2"
}
# Terraform ACI Fabric Policies Module - default Example

The purpose of this Example is to show the most basic example of the module when accepting all the defaults defined in the module.  Note that there are only four variables that need to be created for the modules which are snmp username and authentication key, snmp community string for communities, and for the trap server the user or community.  Obviously in a real deployment scenario you would want to change default IP addresses and other values in the modules.  But we want to show the most simple form of the deployment.

The reason the above variables are not created as part of the defaults is they are all variables that should be securely encrypted/protected using something like environment variables (at the most basic level), Terraform Cloud, or Vault.  Do not store the above variables in any directory that would be published to something public like github.com.  Terraform Cloud is a really great option because you can mark the variables as sensative which will securly protect them, and vault is an even better option, on top of that.

## Important Ordering Information

There is an important order to the creation of the resources.  Below is the outline that is important to follow:

SNMP Client(s):

* First: Create the SNMP Client Group (snmp_client_grp).
* Second: Assign the SNMP Client(s) to the Client Group (snmp_clients).

SNMP Trap Server(s):

* First: Create the SNMP Trap Destination Group (snmp_dest_grp).
* Second: Create the SNMP Trap Source (snmp_trap_src).
* Third: Assign the SNMP Trap Server(s) to the Trap Destination Group (snmp_trap_server).

Syslog Server(s):

* First: Create the Syslog Destination Group (syslog_dest_grp).
* Second: Create the Syslog Source (syslog_source).
* Third: Assign the Syslog Server(s) to the Syslog Destination Group (syslog_server).

## Important Note

The terraform-aci-fabric module defaults use the oob "default" EPG.  Inband doesn't have an EPG by default.  An Inband EPG must be created before running this module if you are not using the default "oob" EPG.

## Usage Example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | > 0.14 |
| aci | >= 0.5.2 |

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| fabric_best_practices | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/best_practices | 0.0.6 |
| fabric_bgp | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/bgp | 0.0.6 |
| fabric_dns | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/dns | 0.0.6 |
| fabric_ntp | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/ntp | 0.0.6 |
| fabric_pod_policy | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/pod_policy | 0.0.6 |
| fabric_smart_callhome | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/smart_callhome | 0.0.6 |
| fabric_snmp_client_grp | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_client_grp | 0.0.6 |
| fabric_snmp_clients | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_clients | 0.0.6 |
| fabric_snmp_community | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_community | 0.0.6 |
| fabric_snmp_dest_grp | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_dest_grp | 0.0.6 |
| fabric_snmp_trap_server | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_trap_server | 0.0.6 |
| fabric_snmp_trap_source | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_trap_source | 0.0.6 |
| fabric_snmp_user | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_user | 0.0.6 |
| fabric_syslog_dest_grp | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/syslog_dest_grp | 0.0.6 |
| fabric_syslog_server | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/syslog_server | 0.0.6 |
| fabric_syslog_source | app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/syslog_source | 0.0.6 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aciPass | NEVER Store your USERNAME or PASSWORD in a Public Repository | `string` | n/a | yes |
| aciUrl | This can be the IP or Hostname of the ACI Host you will be configuring | `string` | `"https://brahma-apic1.rich.ciscolabs.com"` | no |
| aciUser | If using a Domain with the User Remember to add apic#[domain]\<username> | `string` | n/a | yes |
| auth\_key1 | n/a | `string` | n/a | yes |
| community1 | n/a | `string` | n/a | yes |
| snmp\_user1 | n/a | `string` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
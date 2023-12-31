#
# Create Base BGP Configuration
#
resource "iosxe_bgp" "isprouterbgp" {
  asn                  = "4771"
  default_ipv4_unicast = false
  log_neighbor_changes = true
}

#
# Create the Internet VRF within BGP
#
resource "iosxe_bgp_address_family_ipv4_vrf" "isprouterbgpvrfinternet" {
  asn     = "4771"
  af_name = "unicast"
  vrfs = [
    {
      name = "internet"
      #      ipv4_unicast_redistribute_static = true
      ipv4_unicast_networks = [
        {
          network   = "0.0.0.0"
          route_map = "rm-static"
          backdoor  = false
        }
      ]
    }
  ]
}

#
# Define the eBGP neighbor within the VRF
# Add the dependency route-maps with nested prefix-list
#
resource "iosxe_bgp_ipv4_unicast_vrf_neighbor" "ce1_to_pe1" {
  asn                          = "4771"
  vrf                          = "internet"
  ip                           = "200.1.1.2"
  remote_as                    = "714"
  description                  = "Apple CE1"
  default_originate            = "true"
  shutdown                     = false
  log_neighbor_changes_disable = false
  password_type                = 1
  password                     = "mysupersecurebgppassword"
  timers_keepalive_interval    = 30
  timers_holdtime              = 40
  timers_minimum_neighbor_hold = 30
  version                      = 4
  activate                     = true
  send_community               = "both"
  soft_reconfiguration         = "inbound"
  route_reflector_client       = false
  route_maps = [
    {
      in_out         = "in"
      route_map_name = "rm-pe1-in"
    },
    {
      in_out         = "out"
      route_map_name = "rm-pe1-out"
    }
  ]
}

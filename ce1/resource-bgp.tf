#
# Create Base BGP Configuration
#
resource "iosxe_bgp" "applerouterbgp" {
  asn                  = "714"
  default_ipv4_unicast = false
  log_neighbor_changes = true
}

#
# Create the Edge VRF within BGP
#
resource "iosxe_bgp_address_family_ipv4_vrf" "applerouterbgpvrfinternet" {
  asn     = "714"
  af_name = "unicast"
  vrfs = [
    {
      name                                = "edge"
      ipv4_unicast_redistribute_connected = true
      ipv4_unicast_redistribute_static    = true
      ipv4_unicast_networks = [
        {
          network   = "0.0.0.0"
          route_map = "rm-connected"
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
  asn                          = "714"
  vrf                          = "edge"
  ip                           = "200.1.1.1"
  remote_as                    = "4771"
  description                  = "ISP PE1"
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
      route_map_name = "rm-ce1-in"
    },
    {
      in_out         = "out"
      route_map_name = "rm-ce1-out"
    }
  ]
}
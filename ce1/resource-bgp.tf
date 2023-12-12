resource "iosxe_bgp" "applerouterbgp" {
  asn                  = "714"
  default_ipv4_unicast = false
  log_neighbor_changes = true
}
resource "iosxe_bgp_address_family_ipv4_vrf" "applerouterbgpvrfedge" {
  asn     = "714"
  af_name = "unicast"
  vrfs = [
    {
      name                                = "edge"
      ipv4_unicast_redistribute_connected = true
    }
  ]
}
resource "iosxe_bgp_ipv4_unicast_vrf_neighbor" "ce1_to_pe1" {
  asn                          = "714"
  vrf                          = "edge"
  ip                           = "200.1.1.1"
  remote_as                    = "4771"
  description                  = "ISP PE1"
  shutdown                     = false
  log_neighbor_changes_disable = true
#  password_type                = 1
#  password                     = "mysupersecurebgppassword"
  timers_keepalive_interval    = 30
  timers_holdtime              = 40
  timers_minimum_neighbor_hold = 30
  version                      = 4
  activate                     = true
  send_community               = "both"
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
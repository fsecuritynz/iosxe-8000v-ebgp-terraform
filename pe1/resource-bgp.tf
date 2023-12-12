resource "iosxe_bgp" "isprouterbgp" {
  asn                  = "4771"
  default_ipv4_unicast = false
  log_neighbor_changes = true
}
resource "iosxe_bgp_address_family_ipv4_vrf" "isprouterbgpvrfinternet" {
  asn     = "4771"
  af_name = "unicast"
  vrfs = [
    {
      name                             = "internet"
      ipv4_unicast_redistribute_static = true
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
resource "iosxe_bgp_ipv4_unicast_vrf_neighbor" "ce1_to_pe1" {
  asn                          = "4771"
  vrf                          = "internet"
  ip                           = "200.1.1.2"
  remote_as                    = "714"
  description                  = "Apple CE1"
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
      route_map_name = "rm-pe1-in"
    },
    {
      in_out         = "out"
      route_map_name = "rm-pe1-out"
    }
  ]
}

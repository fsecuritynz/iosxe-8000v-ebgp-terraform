#
# Configure GigabitEthernet Interface, within VRF
#
resource "iosxe_interface_ethernet" "ge2" {
  type              = "GigabitEthernet"
  name              = "2"
  vrf_forwarding    = "internet"
  description       = "_to_APPLE_CE1-Internet"
  shutdown          = false
  ip_proxy_arp      = false
  ip_redirects      = false
  ip_unreachables   = false
  ipv4_address      = "200.1.1.1"
  ipv4_address_mask = "255.255.255.252"
  ipv6_enable       = false
  arp_timeout       = 300
}
resource "iosxe_interface_ethernet" "ge3" {
  type              = "GigabitEthernet"
  name              = "3"
  vrf_forwarding    = "internet"
  description       = "UPSTREAM-GATEWAY"
  shutdown          = false
  ip_proxy_arp      = false
  ip_redirects      = false
  ip_unreachables   = false
  ipv4_address      = "200.2.2.2"
  ipv4_address_mask = "255.255.255.252"
  ipv6_enable       = false
  arp_timeout       = 300
}

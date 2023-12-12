resource "iosxe_interface_ethernet" "applege2" {
  type              = "GigabitEthernet"
  name              = "2"
  vrf_forwarding    = "edge"
  description       = "_to_PROVIDER_PE1-Internet"
  shutdown          = false
  ip_proxy_arp      = false
  ip_redirects      = false
  ip_unreachables   = false
  ipv4_address      = "200.1.1.2"
  ipv4_address_mask = "255.255.255.252"
  ipv6_enable       = false
  arp_timeout       = 300
}
resource "iosxe_interface_loopback" "appleloopback" {
  name              = 10
  description       = "Apple Test Loopback"
  shutdown          = false
  ip_proxy_arp      = false
  ip_redirects      = false
  ip_unreachables   = false
  vrf_forwarding    = "edge"
  ipv4_address      = "110.10.20.30"
  ipv4_address_mask = "255.255.255.255"
  arp_timeout       = 2147
}

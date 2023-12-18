resource "iosxe_static_route_vrf" "static_default_vrf_internet_route_a" {
  vrf = "edge"
  routes = [{
    prefix = "1.1.1.1"
    mask   = "255.255.255.255"
    next_hops = [{
      next_hop = "Null0"
      name     = "test null route 1"
    }]
  }]
}
resource "iosxe_static_route_vrf" "static_default_vrf_internet_route_b" {
  vrf = "edge"
  routes = [{
    prefix = "2.2.2.2"
    mask   = "255.255.255.255"
    next_hops = [{
      next_hop = "Null0"
      name     = "test null route 2"
    }]
  }]
}
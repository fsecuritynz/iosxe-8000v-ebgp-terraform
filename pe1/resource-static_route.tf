resource "iosxe_static_route_vrf" "static_default_vrf_internet_route" {
  vrf = "internet"
  routes = [
    {
      prefix = "0.0.0.0"
      mask   = "0.0.0.0"
      next_hops = [
        {
          next_hop = "200.2.2.1"
          name     = "internet-default-route"
        }
      ]
    }
  ]
}
resource "iosxe_static_route_vrf" "static_default_vrf_internet_routeB" {
  vrf = "internet"
  routes = [{
    prefix = "0.0.0.0"
    mask   = "0.0.0.0"
    next_hops = [{
      next_hop = "Null0"
      name     = "test null route"
    }]
  }]
}
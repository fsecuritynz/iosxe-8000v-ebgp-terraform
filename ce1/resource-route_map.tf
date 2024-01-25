#
# Build route-maps with the prefix-lists as a dependency
#
resource "iosxe_route_map" "apple_internet_rm-out" {
  name = "rm-ce1-out"
  entries = [
    {
      seq                           = 10
      operation                     = "permit"
      description                   = "Entry 10"
      continue                      = false
      match_ip_address_prefix_lists = ["pl-ce1-out"]
    },
    {
      seq                           = 20
      operation                     = "permit"
      description                   = "Entry 10"
      continue                      = false
      match_ip_address_prefix_lists = ["pl-internet-prefixes"]
    }
  ]
}
resource "iosxe_route_map" "apple_internet_rm-in" {
  name = "rm-ce1-in"
  entries = [
    {
      seq                           = 10
      operation                     = "permit"
      description                   = "Entry 10"
      continue                      = false
      match_ip_address_prefix_lists = ["pl-ce1-in"]
    }
  ]
}
resource "iosxe_route_map" "isp_internet_rm-connected" {
  name = "rm-connected"
  entries = [
    {
      seq                           = 10
      operation                     = "permit"
      description                   = "Entry 10"
      continue                      = false
      match_ip_address_prefix_lists = ["pl-all"]
    }
  ]
}

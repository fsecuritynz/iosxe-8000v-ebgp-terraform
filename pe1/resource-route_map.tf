#
# Build route-maps with the prefix-lists as a dependency
#
resource "iosxe_route_map" "isp_internet_rm-in" {
  name = "rm-pe1-in"
  entries = [
    {
      seq                           = 10
      operation                     = "permit"
      description                   = "Entry 10"
      continue                      = false
      match_ip_address_prefix_lists = ["pl-pe1-in"]
    }
  ]
}
resource "iosxe_route_map" "isp_internet_rm-out" {
  name = "rm-pe1-out"
  entries = [
    {
      seq                           = 10
      operation                     = "permit"
      description                   = "Entry 10"
      continue                      = false
      match_ip_address_prefix_lists = ["pl-pe1-out"]
    }
  ]
}
resource "iosxe_route_map" "isp_internet_rm-static" {
  name = "rm-static"
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

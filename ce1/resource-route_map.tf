resource "iosxe_route_map" "apple_internet_rmo-ut" {
  name = "rm-ce1-in"
  entries = [
    {
      seq                           = 10
      operation                     = "permit"
      description                   = "Entry 10"
      continue                      = false
      match_ip_address_prefix_lists = ["pl-ce1-out"]
    }
  ]
}
resource "iosxe_route_map" "apple_internet_rm-in" {
  name = "rm-ce1-out"
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

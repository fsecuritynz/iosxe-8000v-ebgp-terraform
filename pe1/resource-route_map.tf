resource "iosxe_route_map" "isp_internet_rmo-ut" {
  name = "rm-pe1-in"
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
resource "iosxe_route_map" "isp_internet_rm-in" {
  name = "rm-pe1-out"
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

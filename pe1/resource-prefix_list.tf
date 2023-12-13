#
# Define some prefix-list entries
#
resource "iosxe_prefix_list" "isp_internet_pl-out" {
  prefixes = [
    {
      name   = "pl-pe1-out"
      seq    = 10
      action = "permit"
      ip     = "0.0.0.0/0"
      le     = 32
    }
  ]
}
resource "iosxe_prefix_list" "isp_internet_pl-in" {
  prefixes = [
    {
      name   = "pl-pe1-in"
      seq    = 10
      action = "permit"
      ip     = "110.10.20.30/32"
    }
  ]
}
resource "iosxe_prefix_list" "isp_internet_pl-all" {
  prefixes = [
    {
      name   = "pl-all"
      seq    = 10
      action = "permit"
      ip     = "0.0.0.0/0"
      le     = 32
    }
  ]
}

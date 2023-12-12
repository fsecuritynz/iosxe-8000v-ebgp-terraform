resource "iosxe_prefix_list" "apple_internet_pl-out" {
  prefixes = [
    {
      name   = "pl-ce1-out"
      seq    = 10
      action = "permit"
      ip     = "110.10.20.30/32"
    }
  ]
}
resource "iosxe_prefix_list" "apple_internet_pl-in" {
  prefixes = [
    {
      name   = "pl-ce1-in"
      seq    = 10
      action = "permit"
      ip     = "0.0.0.0/32"
    }
  ]
}

resource "iosxe_vrf" "internetvrf" {
  name                = "internet"
  description         = "Spark Internet VRF"
  address_family_ipv4 = true
  rd                  = "4771:4771"
}

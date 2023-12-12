resource "iosxe_vrf" "edgevrf" {
  name                = "edge"
  description         = "Apple Internet Edge VRF"
  address_family_ipv4 = true
  rd                  = "714:714"
}

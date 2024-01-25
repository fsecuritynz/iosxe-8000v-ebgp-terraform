#
# Define a VRF 
# Set a route-distinguisher - very important for VRF BGP policy later. Will not work without it.
# Set the IPv4 Address Family
#
resource "iosxe_vrf" "edgevrf" {
  name                = "edge"
  description         = "Apple Internet Edge VRF"
  address_family_ipv4 = true
  rd                  = "714:714"
}

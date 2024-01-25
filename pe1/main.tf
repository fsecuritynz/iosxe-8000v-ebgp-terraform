#
# Define the IOSXE provider
# Define the username & password
# Define the HTTPS URL for RestAPI Configuration Implementation
#
provider "iosxe" {
  username = "admin"
  password = "cisco123"
  url      = "https://10.8.8.21"
}

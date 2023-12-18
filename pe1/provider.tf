#
# Define the Terraform Provider Module Required
#
terraform {
  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = ">= 0.5.2"
    }
  }
}

# iosxe-8000v-ebgp-terraform

# Overview
Utilises the new Cisco IOS-XE Terraform Provider to deploy:
- Interfaces
- VRF's
- Prefix Lists
- Prefix Lists from CSV
- Route Maps
- eBGP Configuration
- Static Routes

https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs

# Topology
## PE1
### Interfaces
#### GigabitEthernet1
- Function: MGMT (Terraform)
- IP: 10.8.8.21/24

#### GigabitEthernet2
- Function: eBGP with CE1
- IP: 200.1.1.1/30

### Static Route
- VRF: internet
- 0.0.0.0/0 via 200.2.2.1

### Route Policy
#### rm-pe1-out / pl-pe1-out
- Permit 0.0.0.0/0

#### rm-pe1-in / pl-pe1-out
- Permit 110.10.20.30/32

### BGP
- VRF: internet
- Redistribute: static
- Local ASN: 4771
- Remote IP: 200.1.1.2
- Remote ASN: 714
- Route-map Out: rm-pe1-out
- Route-map In: rm-pe1-in


## CE1
### Interfaces
#### GigabitEthernet1
- Function: MGMT (Terraform)
- IP: 10.8.8.22/24

#### GigabitEthernet2
- Function: eBGP with CE1
- IP: 200.1.1.2/30

#### Loopback 10
- Function: Dummy Route Test
- IP: 110.10.20.30/32

### Route Policy
#### rm-ce1-out / pl-ce1-out
- Permit 110.10.20.30/32

#### rm-ce1-in / pl-ce1-out
- Permit 0.0.0.0/0

### BGP
- VRF: edge
- Redistribute: connected
- Local ASN: 714
- Remote IP: 200.1.1.1
- Remote ASN: 4771
- Route-map Out: rm-ce1-out
- Route-map In: rm-ce1-in

# GCP to AWS HA VPN Module
This module is responsible for deploying all of the infrastructure required for the setup of a GCP-AWS HA VPN.

An example use of this module can be found below:

## Example

main.tf file:
```hcl
module "ha-vpn" {
  source = "./vpn"
  aws_gw1_tunnel1_address = var.aws_gw1_tunnel1_address
  aws_gw1_tunnel1_inside_address = var.aws_gw1_tunnel1_inside_address
  aws_gw1_tunnel1_peer_ip = var.aws_gw1_tunnel1_peer_ip
  aws_gw1_tunnel1_shared_secret = var.aws_gw1_tunnel1_shared_secret
  aws_gw1_tunnel2_address = var.aws_gw1_tunnel2_address
  aws_gw1_tunnel2_inside_address = var.aws_gw1_tunnel2_inside_address
  aws_gw1_tunnel2_peer_ip = var.aws_gw1_tunnel2_peer_ip
  aws_gw1_tunnel2_shared_secret = var.aws_gw1_tunnel2_shared_secret
  aws_gw2_tunnel1_address = var.aws_gw2_tunnel1_address
  aws_gw2_tunnel1_inside_address = var.aws_gw2_tunnel1_inside_address
  aws_gw2_tunnel1_peer_ip = var.aws_gw2_tunnel1_peer_ip
  aws_gw2_tunnel1_shared_secret = var.aws_gw2_tunnel1_shared_secret
  aws_gw2_tunnel2_address = var.aws_gw2_tunnel2_address
  aws_gw2_tunnel2_inside_address = var.aws_gw2_tunnel2_inside_address
  aws_gw2_tunnel2_peer_ip = var.aws_gw2_tunnel2_peer_ip
  aws_gw2_tunnel2_shared_secret = var.aws_gw2_tunnel2_shared_secret
  bgp_peer_1 = var.bgp_peer_1
  bgp_peer_2 = var.bgp_peer_2
  bgp_peer_3 = var.bgp_peer_3
  bgp_peer_4 = var.bgp_peer_4
  cloud_router = var.cloud_router
  gcp_asn = var.gcp_asn
  gcp_project_id = var.gcp_project_id
  gcp_region = var.gcp_region
  gw1_tunnel1_asn = var.gw1_tunnel1_asn
  gw1_tunnel2_asn = var.gw1_tunnel2_asn
  gw2_tunnel1_asn = var.gw2_tunnel1_asn
  gw2_tunnel2_asn = var.gw2_tunnel2_asn
  ha_vpn_gateway = var.ha_vpn_gateway
  network = var.network
  peer_gw_name = var.peer_gw_name
  router_int0 = var.router_int0
  router_int1 = var.router_int1
  router_int2 = var.router_int2
  router_int3 = var.router_int3
  subnet_ip_cidr = var.subnet_ip_cidr
  tunnel_name_if1 = var.tunnel_name_if1
  tunnel_name_if2 = var.tunnel_name_if2
  tunnel_name_if3 = var.tunnel_name_if3
  tunnel_name_if4 = var.tunnel_name_if4
}
```

terraform.tfvars file:
```hcl
  aws_gw1_tunnel1_address = "52.89.198.230"
  aws_gw1_tunnel1_inside_address = "169.254.32.106/30"
  aws_gw1_tunnel1_peer_ip = "169.254.32.105"
  aws_gw1_tunnel2_address = "54.188.158.157"
  aws_gw1_tunnel2_inside_address = "169.254.75.146/30"
  aws_gw1_tunnel2_peer_ip = "169.254.75.145"
  aws_gw2_tunnel1_address = "34.214.101.175"
  aws_gw2_tunnel1_inside_address = "169.254.27.214/30"
  aws_gw2_tunnel1_peer_ip = "169.254.27.213"
  aws_gw2_tunnel2_address = "54.189.127.207"
  aws_gw2_tunnel2_inside_address = "169.254.184.86/30"
  aws_gw2_tunnel2_peer_ip = "169.254.184.85"
  bgp_peer_1 = "peer-0"
  bgp_peer_2 = "peer-1"
  bgp_peer_3 = "peer-2"
  bgp_peer_4 = "peer-3"
  cloud_router = "tranquilitybase-router"
  gcp_asn = "64600"
  gcp_project_id = "zain-sandbox"
  gcp_region = "us-west1"
  gw1_tunnel1_asn = "64599"
  gw1_tunnel2_asn = "64599"
  gw2_tunnel1_asn = "64599"
  gw2_tunnel2_asn = "64599"
  ha_vpn_gateway = "ha-vpn-gw-tranquilitybase"
  network = "network-a"
  peer_gw_name = "aws-example"
  router_int0 = "tunnel-1-to-aws-if-0"
  router_int1 = "tunnel-2-to-aws-if-0"
  router_int2 = "tunnel-1-to-aws-if-1"
  router_int3 = "tunnel-2-to-aws-if-1"
  subnet_ip_cidr = "10.0.1.0/24"
  tunnel_name_if1 = "tunnel-1-to-aws"
  tunnel_name_if2 = "tunnel-2-to-aws"
  tunnel_name_if3 = "tunnel-3-to-aws"
  tunnel_name_if4 = "tunnel-4-to-aws"
  ```
  
## Inputs
| Name               | Description                                                                                                                                                         |  Type  | Default | Required |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----: | :-----: | :------: |
| gcp_project_id         | The ID of the project for where the VPN Gateway is created. ID of the project on the Google Cloud side                                                                                                                | string |    -    |   yes    |
| network            | The name of the network for which the resource belongs to                                                                                                                               | string |    -    |   yes    |
| gcp_region             | The region for which the resource will be located in                                                                                                    | string |    -    |   yes    |
| subnet_ip_cidr             | The IP CIDR range for the subnet in the network for which the resources belong to                                                                                                    | string |    -    |   no    |
| cloud_router       | The name of the cloud router which is responsible for routes to be exchanged dynamically                                                                                                                           |  string  |    -    |   yes    |
| ha_vpn_gateway | The VPN Gateway that will reside in Google Cloud                      | string |    -    |   yes    |
| aws_gw1_tunnel1_shared_secret       | The secret for the first tunnel on gateway 1                                                                                                                     |  string   |    -    |    yes    |
| aws_gw1_tunnel2_shared_secret       | The secret for the second tunnel on gateway 1                                                                                                                     |  string   |    -    |    yes    |
| aws_gw2_tunnel1_shared_secret       | The secret for the first tunnel on gateway 2                                                                                                                     |  string   |    -    |    yes    |
| aws_gw2_tunnel2_shared_secret       | The secret for the second tunnel on gateway 2                                                                                                                     |  string   |    -    |    yes    |
| tunnel_name_if1        | Name of the first VPN tunnel                                                                                                      |  string   |    -    |    yes    |
| tunnel_name_if2        | Name of the second VPN tunnel                                                                                                      |  string   |    -    |    yes    |
| tunnel_name_if3        | Name of the third VPN tunnel                                                                                                      |  string   |    -    |    yes    |
| tunnel_name_if4        | Name of the fourth VPN tunnel                                                                                                      |  string   |    -    |    yes    |
| gcp_asn        | The private asn that is used for all BGP sessions managed by the cloud router on the Google Cloud side                                                                                                      |  string   |    -    |    yes    |
| router_int0        | The name of the first cloud router interface on interface 0                                                                                                      |  string   |    -    |    yes    |
| router_int1        | The name of the second cloud router interface on interface 0                                                                                                      |  string   |    -    |    yes    |
| router_int2        | The name of the first cloud router interface on interface 1                                                                                                      |  string   |    -    |    yes    |
| router_int3        | The name of the second cloud router interface on interface 1                                                                                                      |  string   |    -    |    yes    |
| peer_gw_name        | The name of the peer VPN Gateway that refers to the VPN Gateway on the AWS side                                                                                                      |  string   |    -    |    yes    |
| aws_gw1_tunnel1_address        | First external IP address for the first AWS VPN connection on gateway 1 interface 0                                                                                                      |  string   |    -    |    yes    |
| aws_gw1_tunnel2_address        | Second external IP address for the first AWS VPN connection on gateway 1 interface 1                                                                                                      |  string   |    -    |    yes    |
| aws_gw2_tunnel1_address        | First external IP address for the second AWS VPN connection on gateway 2 interface 0                                                                                                      |  string   |    -    |    yes    |
| aws_gw2_tunnel2_address        | Second external IP address for the second AWS VPN connection on gateway 2 interface 1                                                                                                      |  string   |    -    |    yes    |
| gw1_tunnel1_asn        | ASN used by the peer VPN Gateway 1 on tunnel 1                                                                                                      |  string   |    -    |    yes    |
| gw1_tunnel2_asn        | ASN used by the peer VPN Gateway 1 on tunnel 2                                                                                                      |  string   |    -    |    yes    |
| gw2_tunnel1_asn        | ASN used by the peer VPN Gateway 2 on tunnel 1                                                                                                      |  string   |    -    |    yes    |
| gw2_tunnel2_asn        | ASN used by the peer VPN Gateway 2 on tunnel 2                                                                                                      |  string   |    -    |    yes    |
| bgp_peer_1        | Name of first BGP peer on interface 0                                                                                                      |  string   |    -    |    yes    |
| bgp_peer_2        | Name of second BGP peer on interface 0                                                                                                      |  string   |    -    |    yes    |
| bgp_peer_3        | Name of first BGP peer on interface 1                                                                                                      |  string   |    -    |    yes    |
| bgp_peer_4        | Name of second BGP peer on interface 1                                                                                                      |  string   |    -    |    yes    |
| aws_gw1_tunnel1_inside_address        | BGP IP address for the tunnel that connects from interface 0 on the GCP side to gateway 1 interface 0 on the AWS side                                                                                                      |  string   |    -    |    yes    |
| aws_gw1_tunnel2_inside_address        | BGP IP address for the tunnel that connects from interface 0 on the GCP side to gateway 1 interface 1 on the AWS side                                                                                                      |  string   |    -    |    yes    |
| aws_gw2_tunnel1_inside_address        | BGP IP address for the tunnel that connects from interface 1 on the GCP side to gateway 2 interface 0 on the AWS side                                                                                                      |  string   |    -    |    yes    |
| aws_gw2_tunnel2_inside_address        | BGP IP address for the tunnel that connects from interface 1 on the GCP side to gateway 2 interface 1 on the AWS side                                                                                                      |  string   |    -    |    yes    |
| aws_gw1_tunnel1_peer_ip        | BGP peer IP address for the tunnel that connects from interface 0 on the GCP side to gateway 1 interface 0 on the AWS side                                                                                                      |  string   |    -    |    yes    |
| aws_gw1_tunnel2_peer_ip        | BGP peer IP address for the tunnel that connects from interface 0 on the GCP side to gateway 1 interface 1 on the AWS side                                                                                                      |  string   |    -    |    yes    |
| aws_gw2_tunnel1_peer_ip        | BGP peer IP address for the tunnel that connects from interface 1 on the GCP side to gateway 2 interface 0 on the AWS side                                                                                                      |  string   |    -    |    yes    |
| aws_gw2_tunnel2_peer_ip        | BGP peer IP address for the tunnel that connects from interface 1 on the GCP side to gateway 2 interface 1 on the AWS side                                                                                                      |  string   |    -    |    yes    |

## Outputs

| Name | Description |
|------|-------------|
| vpn_one_interface_0_ip_address | The IP address associated with interface 0 of the VPN Gateway |
| vpn_one_interface_1_ip_address | The IP address associated with interface 1 of the VPN Gateway |

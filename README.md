# Terraform Google Cloud Platform - GCP to AWS HA VPN Module

A Terraform module for creating HA VPN connection between a GCP network and a AWS network.

This modules makes it easy to set up VPN connectivity in GCP by defining your gateways and tunnels.

It supports creating:

- A Google VPN Gateway
- Tunnels connecting the gateway to defined AWS peer
- Dynamic routes with cloud router

## Compatibility

This module is meant for use with Terraform >=0.12.

## Usage

This module can be used to create the vpn gateways, tunnels etc on the GCP side of the connection.

There are 2 stages needed in order to setup the relevant infrastructure and initiate the VPN connection between the GCP and AWS networks.

The following steps outline how the connection will be setup:

1) Setup GCP network and VPN GW

2) Exchange details with AWS side by providing the 2 IP addresses. 1 IP per address per interface.

3) Setup AWS network, GW and tunnels using IP addresses and the google ASN from the GCP side.

4) Download configuration files for each AWS gateway. 2 in total.

5) Use the addresses retrieved from the AWS configuration files to setup the tunnels and BGP sessions on the GCP side.

6) 4 tunnels needed to be created. Each of the tunnels on the GCP side require 4 pieces of information from the AWS side which can be found in the configuration files.



The VPN module must be consumed in the following manner in order to abide by the steps listed above:

Step 1:

Create GCP VPN gateway first with -target flag

`terraform apply -target module.network.google_compute_ha_vpn_gateway.ha_gateway`


Step 2:

Exchange IP details with 3rd party. Update tfvars file according to the configuration files provided from AWS side.


Step 3:

Create remaining terraform resources

`terraform apply`



The terraform.tfvars file should be generated in the root folder. An example of how the terraform.tfvars file should look:

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

The example folder demonstrates a use of the module to deploying the resources on the GCP side and setting up the VPN connection between both the GCP and AWS networks.

When making use of the module the following commands should be used in the appropriate folders::

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

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

### Configure a Service Account
In order to utilise this module you must have a Service Account with the following roles:
- roles/compute.networkAdmin on the organization

### Enable API's
In order to operate with the Service Account you must activate the following API on the project where the Service Account was created:
- Compute Engine API - compute.googleapis.com

## Development
### File structure
The project has the following folders and files:

- /: root folder
- /example: example for using this module
- /main.tf: calling module, calls the vpn module
- /output.tf: the outputs of the module
- /variables.tf: all the variables for the module
- /vpn: module that is responsible for the setup of the vpn
- /README.md: this file



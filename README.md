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





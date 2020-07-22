variable "gcp_project_id" {
description = "The ID of the project for where the VPN Gateway is created. ID of the project on the Google Cloud side"
}

variable "gcp_region" {
  description = "The region for which the resource will be located in"
}

variable "network" {
  description = "The name of the network for which the resource belongs to"
}

variable "subnet_ip_cidr" {
  description = "The IP CIDR range for the subnet in the network for which the resources belong to"
}

variable "ha_vpn_gateway" {
  description = "The VPN Gateway that will reside in Google Cloud"
}

variable "cloud_router" {
  description = "The name of the cloud router which is responsible for routes to be exchanged dynamically"
}

variable "gcp_asn" {
  description = "The private asn that is used for all BGP sessions managed by the cloud router on the Google Cloud side"
}

variable "gw1_tunnel1_asn" {
  description = "ASN used by the peer VPN Gateway 1 on tunnel 1"
}

variable "gw1_tunnel2_asn" {
  description = "ASN used by the peer VPN Gateway 1 on tunnel 2"
}

variable "gw2_tunnel1_asn" {
  description = "ASN used by the peer VPN Gateway 2 on tunnel 1"
}

variable "gw2_tunnel2_asn" {
  description = "ASN used by the peer VPN Gateway 2 on tunnel 1"
}

variable "peer_gw_name" {
  description = "The name of the peer VPN Gateway that refers to the VPN Gateway on the AWS side"
}

variable "aws_gw1_tunnel1_address" {
  description = "First external IP address for the first AWS VPN connection on gateway 1 interface 0"
}

variable "aws_gw1_tunnel2_address" {
  description = "Second external IP address for the first AWS VPN connection on gateway 1 interface 1"
}

variable "aws_gw2_tunnel1_address" {
  description = "First external IP address for the second AWS VPN connection on gateway 2 interface 0"
}

variable "aws_gw2_tunnel2_address" {
  description = "Second external IP address for the second AWS VPN connection on gateway 2 interface 1"
}

variable "aws_gw1_tunnel1_shared_secret" {
  description = "The secret for the first tunnel on gateway 1"
}

variable "aws_gw1_tunnel2_shared_secret" {
  description = "The secret for the second tunnel on gateway 1"
}

variable "aws_gw2_tunnel1_shared_secret" {
  description = "The secret for the first tunnel on gateway 2"
}

variable "aws_gw2_tunnel2_shared_secret" {
  description = "The secret for the second tunnel on gateway 2"
}

variable "tunnel_name_if1" {
  description = "Name of the first VPN tunnel"
}

variable "tunnel_name_if2" {
  description = "Name of the second VPN tunnel"
}

variable "tunnel_name_if3" {
  description = "Name of the third VPN tunnel"
}

variable "tunnel_name_if4" {
  description = "Name of the fourth VPN tunnel"
}

variable "router_int0" {
description = "The name of the first cloud router interface on interface 0"
}

variable "router_int1" {
  description = "The name of the second cloud router interface on interface 0"
}

variable "router_int2" {
  description = "The name of the first cloud router interface on interface 1"
}

variable "router_int3" {
  description = "The name of the second cloud router interface on interface 1"
}

variable "bgp_peer_1" {
  description = "Name of first BGP peer on interface 0"
}

variable "bgp_peer_2" {
  description = "Name of second BGP peer on interface 0"
}

variable "bgp_peer_3" {
  description = "Name of first BGP peer on interface 1"
}

variable "bgp_peer_4" {
  description = "Name of second BGP peer on interface 1"
}

variable "aws_gw1_tunnel1_inside_address" {
  description = "BGP IP address for the tunnel that connects from interface 0 on the GCP side to gateway 1 interface 0 on the AWS side "
}

variable "aws_gw1_tunnel2_inside_address" {
  description = "BGP IP address for the tunnel that connects from interface 0 on the GCP side to gateway 1 interface 1 on the AWS side"
}

variable "aws_gw2_tunnel1_inside_address" {
  description = "BGP IP address for the tunnel that connects from interface 1 on the GCP side to gateway 2 interface 0 on the AWS side"
}

variable "aws_gw2_tunnel2_inside_address" {
  description = "BGP IP address for the tunnel that connects from interface 1 on the GCP side to gateway 2 interface 1 on the AWS side"
}

variable "aws_gw1_tunnel1_peer_ip" {
  description = "BGP peer IP address for the tunnel that connects from interface 0 on the GCP side to gateway 1 interface 0 on the AWS side"
}

variable "aws_gw1_tunnel2_peer_ip" {
  description = "BGP peer IP address for the tunnel that connects from interface 0 on the GCP side to gateway 1 interface 1 on the AWS side"
}

variable "aws_gw2_tunnel1_peer_ip" {
  description = "BGP peer IP address for the tunnel that connects from interface 1 on the GCP side to gateway 2 interface 0 on the AWS side"
}

variable "aws_gw2_tunnel2_peer_ip" {
  description = "BGP peer IP address for the tunnel that connects from interface 1 on the GCP side to gateway 2 interface 1 on the AWS side"
}


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




the vpn module must be consumed in the following manner:


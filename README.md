# Terraform Google Cloud Platform - GCP to AWS HA VPN Module

A Terraform module for creating HA VPN connection between a GCP network and a AWS network.

This modules makes it easy to set up VPN connectivity in GCP by defining your gateways and tunnels.

It supports creating:

- A Google VPN Gateway
- Tunnels connecting the gateway to defined AWS peer
- Dynamic routes with cloud router

## Compatibility

This module is meant for use with Terraform >=0.12.

output vpn_interface_0_ip_address {
  description = "The IP address associated with interface 0 of the VPN Gateway"
  value = google_compute_ha_vpn_gateway.ha_gateway.vpn_interfaces[0].ip_address
}

output vpn_interface_1_ip_address {
   description = "The IP address associated with interface 1 of the VPN Gateway"
   value = google_compute_ha_vpn_gateway.ha_gateway.vpn_interfaces[1].ip_address
}

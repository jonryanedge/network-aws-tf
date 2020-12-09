resource "aws_customer_gateway" "primaryCustomerGw" {
  bgp_asn = var.vpnConnections["primaryAsn"]
  ip_address = var.vpnConnections["primaryIp"]
  type = "ipsec.1"
}

resource "aws_customer_gateway" "secondaryCustomerGw" {
  bgp_asn = var.vpnConnections["secondaryAsn"]
  ip_address = var.vpnConnections["secondaryIp"]
  type = "ipsec.1"
}

resource "aws_vpn_connection" "primaryVpn" {
  customer_gateway_id = aws_customer_gateway.primaryCustomerGw.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  type = aws_customer_gateway.primaryCustomerGw.type
  static_routes_only = false

  tags = {
    "Name" = "Primary VPN Connection"
  }
}

resource "aws_vpn_connection" "secondaryVpn" {
  customer_gateway_id = aws_customer_gateway.primaryCustomerGw.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  type = aws_customer_gateway.primaryCustomerGw.type
  static_routes_only = false

  tags = {
    "Name" = "Secondary VPN Connection"
  }
}
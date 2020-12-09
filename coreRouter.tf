resource "aws_ec2_transit_gateway" "tgw" {
  amazon_side_asn                 = var.regionAsn
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = "enable"
  vpn_ecmp_support                = "enable"
  description                     = "core router"

  tags = {
    "Name"    = "coreRouter"
    "network" = "core"
    "asn"     = var.regionAsn
    "cidr"    = var.regionCidr
  }
}

resource "aws_ssm_parameter" "tgwParam" {
  type        = "String"
  name        = "/network/coreRouterId"
  description = "Core Transit Gateway Id"
  value       = aws_ec2_transit_gateway.tgw.id
}

resource "aws_ec2_transit_gateway_route_table" "edgeRouteTable" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

resource "aws_ec2_transit_gateway_route" "DefaultRoute" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.edgeRouteTable.id
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.edgeVpcTgwAttachment.id
}
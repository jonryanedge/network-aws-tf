# resource "aws_dx_gateway" "dxgw1" {
#   name = "dxgw1"
#   amazon_side_asn = var.dxgw["dxAsn"]
# }

# resource "aws_dx_gateway_association" "coreVgwDxGw" {
#   dx_gateway_id = aws_dx_gateway.dxgw1.id
#   associated_gateway_id = aws_vpn_gateway.coreVgw.id
# }

# resource "aws_dx_gateway_association" "memberVgwDxGw" {
#   dx_gateway_id = aws_dx_gateway.dxgw1.id
#   associated_gateway_id = aws_vpn_gateway.memberVgw.id
# }


# resource "aws_dx_gateway" "dxgwTransit" {
#   name = "dxgwTransit"
#   amazon_side_asn = "65506"
# }
# resource "aws_dx_gateway_association" "dxgw1TgwA" {
#   dx_gateway_id = aws_dx_gateway.dxgwTransit.id
#   associated_gateway_id = aws_ec2_transit_gateway.tgw.id

#   allowed_prefixes = [ var.dxgw["dxCidr"] ]
# }
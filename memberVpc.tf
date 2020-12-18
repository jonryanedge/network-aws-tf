resource "aws_vpc" "member" {
  cidr_block           = var.memberVpc["vpcCidr"]
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name    = "member"
    Network = "member"
  }
}

resource "aws_subnet" "member1" {
  vpc_id = aws_vpc.member.id
  cidr_block = var.memberVpc["member1"]
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    "Name" = "Member1",
  }
}

resource "aws_subnet" "member2" {
  vpc_id = aws_vpc.member.id
  cidr_block = var.memberVpc["member2"]
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    "Name" = "Member2",
  }
}

resource "aws_route_table" "memberRT" {
  vpc_id = aws_vpc.member.id

  tags = {
    "Name" = "Private Route Table"
  }
}

resource "aws_route_table_association" "private1Rt" {
  route_table_id = aws_route_table.memberRT.id
  subnet_id = aws_subnet.private1.id
}

resource "aws_route_table_association" "private2Rt" {
  route_table_id = aws_route_table.memberRT.id
  subnet_id = aws_subnet.private2.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "memberVpcTgwAttachment" {
  subnet_ids         = [aws_subnet.private1.id, aws_subnet.private2.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  transit_gateway_default_route_table_association = true
  vpc_id             = aws_vpc.member.id
}

resource "aws_route" "memberTgw" {
  route_table_id = aws_route_table.memberRT.id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route53_zone_association" "memberRt53Zone1" {
  vpc_id = aws_vpc.member.id
  zone_id = aws_route53_zone.zone1.id
}

resource "aws_route53_resolver_rule_association" "memberRt53Rule1" {
 vpc_id = aws_vpc.member.id 
 resolver_rule_id = aws_route53_resolver_rule.mainFwd.id
}


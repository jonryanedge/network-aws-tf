resource "aws_vpc" "core" {
  cidr_block           = var.coreCidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name    = "core"
    Network = "core"
  }
}

resource "aws_subnet" "core1" {
  vpc_id = aws_vpc.core.id
  cidr_block = var.coreSubnets["core1"]
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    "Name" = "Core1",
  }
}

resource "aws_subnet" "core2" {
  vpc_id = aws_vpc.core.id
  cidr_block = var.coreSubnets["core2"]
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    "Name" = "Core2",
  }
}

resource "aws_subnet" "shared1" {
  vpc_id = aws_vpc.core.id
  cidr_block = var.coreSubnets["shared1"]
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    "Name" = "Shared1",
  }
}

resource "aws_subnet" "shared2" {
  vpc_id = aws_vpc.core.id
  cidr_block = var.coreSubnets["shared2"]
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    "Name" = "Shared2",
  }
}

resource "aws_route_table" "CoreRT" {
  vpc_id = aws_vpc.core.id

  tags = {
    "Name" = "Core RT"
  }
}

resource "aws_route_table" "SharedRT" {
  vpc_id = aws_vpc.core.id

  tags = {
    "Name" = "Shared RT"
  }
}

resource "aws_route_table_association" "core1RT" {
  route_table_id = aws_route_table.CoreRT.id
  subnet_id = aws_subnet.core1.id
}

resource "aws_route_table_association" "core2RT" {
  route_table_id = aws_route_table.CoreRT.id
  subnet_id = aws_subnet.core2.id
}

resource "aws_route_table_association" "shared1RT" {
  route_table_id = aws_route_table.SharedRT.id
  subnet_id = aws_subnet.shared1.id
}

resource "aws_route_table_association" "shared2RT" {
  route_table_id = aws_route_table.SharedRT.id
  subnet_id = aws_subnet.shared2.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "coreVpcTgwAttachment" {
  subnet_ids         = [
    aws_subnet.core1.id,
    aws_subnet.core2.id,
    ]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.core.id
}

resource "aws_route" "coreRoute" {
  route_table_id = aws_route_table.CoreRT.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

resource "aws_route" "sharedRoute" {
  route_table_id = aws_route_table.SharedRT.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

resource "aws_vpn_gateway" "coreVgw" {
  vpc_id = aws_vpc.core.id
}


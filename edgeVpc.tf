resource "aws_vpc" "edge" {
  cidr_block           = var.edgeCidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name    = "edge"
    Network = "edge"
  }
}

resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.edge.id
  cidr_block = var.edgeSubnets["public1"]
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    "Name" = "Public1",
  }
}

resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.edge.id
  cidr_block = var.edgeSubnets["public2"]
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    "Name" = "Public2",
  }
}

resource "aws_subnet" "private1" {
  vpc_id = aws_vpc.edge.id
  cidr_block = var.edgeSubnets["private1"]
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    "Name" = "Private1",
  }
}

resource "aws_subnet" "private2" {
  vpc_id = aws_vpc.edge.id
  cidr_block = var.edgeSubnets["private2"]
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    "Name" = "Private2",
  }
}

resource "aws_route_table" "edgePublicRT" {
  vpc_id = aws_vpc.edge.id

  tags = {
    "Name" = "Public RT"
  }
}

resource "aws_route_table" "edgePrivateRtA" {
  vpc_id = aws_vpc.edge.id

  tags = {
    "Name" = "Private RT A"
  }
}

resource "aws_route_table" "edgePrivateRtB" {
  vpc_id = aws_vpc.edge.id

  tags = {
    "Name" = "Private RT B"
  }
}

resource "aws_route_table_association" "public1RT" {
  route_table_id = aws_route_table.edgePublicRT.id
  subnet_id = aws_subnet.public1.id
}

resource "aws_route_table_association" "public2RT" {
  route_table_id = aws_route_table.edgePublicRT.id
  subnet_id = aws_subnet.public2.id
}

resource "aws_route_table_association" "private1RtA" {
  route_table_id = aws_route_table.edgePrivateRtA.id
  subnet_id = aws_subnet.private1.id
}

resource "aws_route_table_association" "private2RtB" {
  route_table_id = aws_route_table.edgePrivateRtB.id
  subnet_id = aws_subnet.private2.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "edgeVpcTgwAttachment" {
  subnet_ids         = [aws_subnet.private1.id, aws_subnet.private2.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  transit_gateway_default_route_table_association = false
  vpc_id             = aws_vpc.edge.id
}

resource "aws_ec2_transit_gateway_route_table_association" "edgeVpcRtAssociation" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.edgeVpcTgwAttachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.edgeRouteTable.id
}

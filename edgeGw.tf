resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.edge.id

  tags = {
    "network" = "edge"
  }
}

resource "aws_route" "defaultPublicRoute" {
 route_table_id = aws_route_table.edgePublicRT.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id = aws_internet_gateway.igw.id
}

resource "aws_eip" "ngwIp1" {
  vpc = true
}

resource "aws_eip" "ngwIp2" {
  vpc = true
}

resource "aws_nat_gateway" "ngw1" {
  allocation_id = aws_eip.ngwIp1.id
  subnet_id = aws_subnet.private1.id
}

resource "aws_nat_gateway" "ngw2" {
  allocation_id = aws_eip.ngwIp2.id
  subnet_id = aws_subnet.private2.id
}

resource "aws_route" "rt-ngw1" {
  route_table_id = aws_route_table.edgePrivateRtA.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.ngw1.id
}

resource "aws_route" "rt-ngw2" {
  route_table_id = aws_route_table.edgePrivateRtB.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.ngw2.id
}
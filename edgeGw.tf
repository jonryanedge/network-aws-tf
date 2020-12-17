resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.edge.id

  tags = {
    "network" = "edge"
  }
}

resource "aws_eip" "ngwIp1" {
  subnet_id = aws_subnet.public1.id
}

resource "aws_eip" "ngwIp2" {
  subnet_id = aws_subnet.public2.id
}

resource "aws_nat_gateway" "ngw1" {
  allocation_id = aws_eip.ngwIp1.id
  subnet_id = aws_subnet.private1.id
}

resource "aws_nat_gateway" "ngw2" {
  allocation_id = aws_eip.ngwIp2.id
  subnet_id = aws_subnet.private2.id
}

resource "aws_route_table_association" "rt-ngw1" {
  
}

resource "aws_route_table_association" "rt-ngw2" {
  
}
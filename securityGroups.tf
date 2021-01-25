resource "aws_security_group" "coreSG" {
  name = "defaultCore"
  vpc_id = aws_vpc.core.id
  
  ingress {
    description = "allowAll"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-all"
  }
}

resource "aws_security_group" "edgeSG" {
  name = "defaultEdge"
  vpc_id = aws_vpc.edge.id
  
  ingress {
    description = "allowAll"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-all"
  }
}
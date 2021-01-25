resource "aws_security_group" "sg1" {
  name = "sg-allow-all"
  vpc_id = aws_vpc.core.id
  
  ingress {
    description = "allowAll"
    from_port   = 0
    to_port     = 40
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
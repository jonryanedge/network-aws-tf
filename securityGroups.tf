resource "aws_security_group" "sg1" {
  name = "security group 1"
  vpc_id = aws_vpc.core.id
  
}
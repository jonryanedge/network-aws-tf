resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.core.id
  service_name = "com.amazonaws.us-west-2.s3"

  tags = {
    Environment = "test"
  }
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.us-west-2.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.us-west-2.ecr"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecs" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.us-west-2.ecs"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "eks" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.us-west-2.eks"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "db" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.us-west-2.dynamodb"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "codecommit" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.us-west-2.codecommit"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "iam" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.us-west-2.iam"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.us-west-2.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.us-west-2.logs"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

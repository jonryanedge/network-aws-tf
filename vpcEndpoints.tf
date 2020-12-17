# Gateway endpoints
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.core.id
  service_name = "com.amazonaws.${var.region}.s3"
  private_dns_enabled = true

  tags = {
    Environment = "test"
  }
}

resource "aws_vpc_endpoint" "db" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"

  private_dns_enabled = true
}

# Interface endpoints
resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

# ecr endpoint not deploying correctly
# resource "aws_vpc_endpoint" "ecr" {
#   vpc_id            = aws_vpc.core.id
#   service_name      = "com.amazonaws.${var.region}.ecr"
#   vpc_endpoint_type = "Interface"

#   security_group_ids = [
#     aws_security_group.sg1.id,
#   ]

#   private_dns_enabled = true
# }

resource "aws_vpc_endpoint" "ecs" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.ecs"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

# eks endpoint not deploying correctly
# resource "aws_vpc_endpoint" "eks" {
#   vpc_id            = aws_vpc.core.id
#   service_name      = "com.amazonaws.${var.region}.eks"
#   vpc_endpoint_type = "Interface"

#   security_group_ids = [
#     aws_security_group.sg1.id,
#   ]

#   private_dns_enabled = true
# }

resource "aws_vpc_endpoint" "codecommit" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.codecommit"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

# iam endpoint not deploying correctly 
# resource "aws_vpc_endpoint" "iam" {
#   vpc_id            = aws_vpc.core.id
#   service_name      = "com.amazonaws.${var.region}.iam"
#   vpc_endpoint_type = "Interface"

#   security_group_ids = [
#     aws_security_group.sg1.id,
#   ]

#   private_dns_enabled = true
# }

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

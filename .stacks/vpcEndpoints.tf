# Gateway endpoints
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.core.id
  service_name = "com.amazonaws.${var.region}.s3"

  tags = {
    Environment = "test"
  }
}

resource "aws_vpc_endpoint" "db" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"

}

# Interface endpoints
resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "lambda" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.lambda"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr-api" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr-dkr" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecs" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.ecs"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecs-agent" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.ecs-agent"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecs-telemetry" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.ecs-telemetry"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "rds" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.rds"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "codecommit" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.codecommit"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "codebuild" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.codebuild"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "codepipeline" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.codepipeline"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "cloudformation" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.cloudformation"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "kms" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.kms"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.core.id
  service_name      = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ aws_subnet.core1.id, aws_subnet.core2.id ]

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}

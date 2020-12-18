resource "aws_route53_zone" "zone1" {
  name = "zone1.example.com"
  
  vpc {
    vpc_id = aws_vpc.core.id
  }
}

resource "aws_route53_resolver_endpoint" "coreResolver" {
  name = "core route53 resolver"
  direction = "INBOUND"

  security_group_ids = [ aws_security_group.sg1.id ]

  ip_address {
    subnet_id = aws_subnet.shared1.id
    ip = var.rt53resolvers["resolverIp1"]
  }

  ip_address {
    subnet_id = aws_subnet.shared2.id
    ip = var.rt53resolvers["resolverIp2"]
  }

  tags = {
    "Name" = "coreResolver"
  }
}

resource "aws_route53_resolver_endpoint" "coreForwarder" {
  name = "core route53 resolver"
  direction = "OUTBOUND"

  security_group_ids = [ aws_security_group.sg1.id ]

  ip_address {
    subnet_id = aws_subnet.shared1.id
    ip = var.rt53resolvers["forwarderIp1"]
  }

  ip_address {
    subnet_id = aws_subnet.shared2.id
    ip = var.rt53resolvers["forwarderIp2"]
  }

  tags = {
    "Name" = "coreForwarder"
  }
}

resource "aws_route53_resolver_rule" "zone1" {
  domain_name = "zone1.example.com"
  name = "zone1"
  rule_type = "SYSTEM"
}

resource "aws_route53_resolver_rule" "mainFwd" {
  domain_name = "example.com"
  name = "example"
  rule_type = "FORWARD"
  resolver_endpoint_id = aws_route53_resolver_endpoint.coreForwarder.id

  target_ip {
    ip = var.rt53resolvers["targetIp1"]
  }

  target_ip {
    ip = var.rt53resolvers["targetIp2"]
  }

  tags = {
    "Name" = "mainFwd"
  }
}

resource "aws_route53_resolver_rule" "fwdAll" {
  domain_name = "."
  name = "fwdAll"
  rule_type = "FORWARD"
  resolver_endpoint_id = aws_route53_resolver_endpoint.coreForwarder.id

  target_ip {
    ip = "162.159.27.72"
  }

  target_ip {
    ip = "162.159.24.39"
  }

  tags = {
    "Name" = "Default DNS forwarder"
  }
}

resource "aws_route53_resolver_rule_association" "coreFwdRule" {
  resolver_rule_id = aws_route53_resolver_rule.mainFwd.id
  vpc_id = aws_vpc.core.id
}

resource "aws_route53_resolver_rule_association" "coreAllRule" {
  resolver_rule_id = aws_route53_resolver_rule.fwdAll.id
  vpc_id = aws_vpc.core.id
}


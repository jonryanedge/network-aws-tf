variable "region" {
  default = "us-west-1"
  description = "Region to deploy (default is us-east-1)"
}

variable "regionAsn" {
  default = "65530"
  description = "ASN for Regional Core Router (TGW)"
}

variable "regionCidr" {
  default = "10.3.0.0/16"
  description = "CIDR Assignment for Core Router (TGW)"
}

variable "coreCidr" {
  default = "10.3.0.0/24"
  description = "CIDR Assignment for Core VPC"
}

variable "edgeCidr" {
  default = "10.3.1.0/24"
  description = "CIDR Assignment for Edge VPC"
}

variable "coreSubnets" {
  type = map
  default = {
    "core1" = "10.3.0.0/27"
    "core2" = "10.3.0.32/27"
    "core3" = "10.3.0.64/27"
    "core4" = "10.3.0.96/27"
    "shared1" = "10.3.0.128/27"
    "shared2" = "10.3.0.160/27"
    "shared3" = "10.3.0.192/27"
    "shared4" = "10.3.0.224/27"
  }
}

variable "edgeSubnets" {
  type = map
  default = {
    "private1" = "10.3.1.0/27"
    "private2" = "10.3.1.32/27"
    "private3" = "10.3.1.64/27"
    "private4" = "10.3.1.96/27"
    "public1" = "10.3.1.128/27"
    "public2" = "10.3.1.160/27"
    "public3" = "10.3.1.192/27"
    "public4" = "10.3.1.224/27"
  }
}

variable "memberVpc" {
  type = map
  default = {
    "vpcCidr" = "10.3.10.0/24"
    "member1" = "10.3.10.0/27"
    "member2" = "10.3.10.32/27"
    "member3" = "10.3.10.64/27"
    "member4" = "10.3.10.96/27"
  }
}

variable "vpnConnections" {
  type = map
  default = {
    "primaryIp" = "1.1.1.1"
    "primaryAsn" = "65501"
    "secondaryIp" = "2.2.2.2"
    "secondaryAsn" = "65502"
  }
}

variable "dxgw" {
  type = map
  default = {
    "dxAsn" = "65505"
    "dxCidr" = "10.3.0.0/16"
  }
}

variable "rt53resolvers" {
  type = map
  default = {
    "resolverIp1" = "10.3.0.140"
    "resolverIp2" = "10.3.0.170"
    "forwarderIp1" = "10.3.0.141"
    "forwarderIp2" = "10.3.0.171"
    "targetIp1" = "8.8.8.8"
    "targetIp2" = "8.8.4.4"
  }
}

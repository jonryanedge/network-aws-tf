variable "region" {
  default = "us-east-1"
  description = "Region to deploy (default is us-east-1)"
}

variable "regionAsn" {
  default = "65500"
  description = "ASN for Regional Core Router (TGW)"
}

variable "regionCidr" {
  default = "10.0.0.0/16"
  description = "CIDR Assignment for Core Router (TGW)"
}

variable "coreCidr" {
  default = "10.0.0.0/24"
  description = "CIDR Assignment for Core VPC"
}

variable "edgeCidr" {
  default = "10.0.1.0/24"
  description = "CIDR Assignment for Edge VPC"
}

variable "coreSubnets" {
  type = map
  default = {
    "core1" = "10.0.0.0/27"
    "core2" = "10.0.0.32/27"
    "core3" = "10.0.0.64/27"
    "core4" = "10.0.0.96/27"
    "shared1" = "10.0.0.128/27"
    "shared2" = "10.0.0.160/27"
    "shared3" = "10.0.0.192/27"
    "shared4" = "10.0.0.224/27"
  }
}

variable "edgeSubnets" {
  type = map
  default = {
    "private1" = "10.0.1.0/27"
    "private2" = "10.0.1.32/27"
    "private3" = "10.0.1.64/27"
    "private4" = "10.0.1.96/27"
    "public1" = "10.0.1.128/27"
    "public2" = "10.0.1.160/27"
    "public3" = "10.0.1.192/27"
    "public4" = "10.0.1.224/27"
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

variable "rt53resolvers" {
  type = map
  default = {
    "resolverIp1" = "1.1.1.53"
    "resolverIp2" = "2.2.2.53"
    "forwarderIp1" = "3.3.3.53"
    "forwarderIp2" = "4.4.4.53"
    "targetIp1" = "8.8.8.8"
    "targetIp2" = "8.8.4.4"
  }
}
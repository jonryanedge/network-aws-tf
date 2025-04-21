terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.95"
    }
  }
  # DISABLED FOR LOCAL USAGE
  # SHOWN FOR USE WITH AWS CODEBUILD & CODEPIPELINES
  #
  # backend "s3" {
  #   encrypt = true
  #   bucket = "TFBUCKET"
  #   dynamodb_table = "TFTABLE"
  #   key = "terraform.tfstate"
  #   region = "TFREGION"
  # }
}

provider "aws" {
  profile = "default"
  region = var.region
}

data "aws_availability_zones" "available" {
  state = "available"
}

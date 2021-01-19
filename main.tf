terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
  backend "s3" {
    encrypt = true
    bucket = "pipeline-pipelinebucket61883daa-1p7kpsu30pjuh"
    dynamodb_table = "tfDbLock-Test"
    key = "terraform.tfstate"
    region = "ca-central-1"
  }
}

provider "aws" {
  profile = "default"
  region = var.region
}

data "aws_availability_zones" "available" {
  state = "available"
}

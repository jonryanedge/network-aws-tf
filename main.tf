terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
  backend "s3" {
    encrypt = true
    bucket = "terraformpipelinestack-pipelinebucket61883daa-13kdxn2qauriu"
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

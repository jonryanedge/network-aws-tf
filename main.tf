terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
  backend "s3" {
    encrypt = true
    bucket = "pipeline-artifacts7424475b-1svmubgw7qfo6"
    dynamodb_table = "tf-State-Lock"
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

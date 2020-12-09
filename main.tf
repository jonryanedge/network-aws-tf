terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
  backend "s3" {
    encrypt = true
    bucket = "terraform-bucket-infrastructure"
    dynamodb_table = "terraform-state-lock-db"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile = "default"
  region = var.region
}

data "aws_availability_zones" "available" {
  state = "available"
}
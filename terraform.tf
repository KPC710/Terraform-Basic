terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 1.0.4"
     }
  }
}

provider "aws" {
  access_key = ""
  secret_key = ""
  region = var.aws_region
}

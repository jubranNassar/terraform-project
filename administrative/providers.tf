terraform {
  required_providers {
       aws = {
      source = "hashicorp/aws"
    }
    spacelift = {
      source = "spacelift-io/spacelift"
      version = "1.1.3"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

# Vào https://registry.terraform.io/ search provider
terraform {
  # Yêu cầu terraform work với api nào
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # profile = "default"
  region = "us-east-1"
}

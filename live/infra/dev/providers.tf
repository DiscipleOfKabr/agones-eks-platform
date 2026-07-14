terraform {

  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "agones-project-bckt"
    key          = "dev/agones-platform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }
}
provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      Environment = "dev"
      Project     = "agones-eks-platform"
      ManagedBy   = "Terraform"
    }
  }
}
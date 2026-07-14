terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }

  
  backend "s3" {
    bucket  = "agones-project-bckt" 
    key     = "eks/dev/terraform.tfstate"        
    region  = "eu-central-1"
    encrypt = true
  }
}

provider "aws" {
  region = "eu-central-1"
}
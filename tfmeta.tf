#Set default region
provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" { state = "available" }

/*
##remote backend configuration
terraform {
  required_providers {
    aws = {
      source  = "registry.terraform.io/hashicorp/aws"
      version = "~> 4.18.0"
    }
  }
  backend "s3" {
    bucket         = "aws_s3_bucket.tfstatefilestore.name"
    key            = "terraform.tfstate"
    dynamodb_table = "aws_dynamodb_table.tfstatefilestore.name"
  }
}
*/
#remote backend s3 storage
resource "aws_s3_bucket" "tfstatefilestore" {
  bucket = "tfstatefilestore"
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name        = "terraform_back"
    Environment = "Test"
  }
}

#remote backend state lock dynamodb table
resource "aws_dynamodb_table" "tfstatefilestore" {
  name = "tfstatefilestore"
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5
  lifecycle {
    prevent_destroy = true
  }
  attribute {
    name = "LockID"
    type = "S"
  }
}

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "iffleygrove-state"
    key    = "main/"
    region = "eu-west-2"
    dynamodb_table = "state_lock"
  }
}
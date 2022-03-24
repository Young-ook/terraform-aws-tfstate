# Complete example

terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region = var.aws_region
}

module "tfstate-backend" {
  source                  = "Young-ook/tfstate-backend/aws"
  name                    = var.name
  dynamodb_read_capacity  = var.dynamodb_read_capacity
  dynamodb_write_capacity = var.dynamodb_write_capacity
  s3_versioning           = var.s3_versioning
  force_destroy           = var.force_destroy
}

### Terraform Remote Backend

terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.aws_region
}

module "tfstate" {
  source                  = "Young-ook/tfstate/aws"
  version                 = "2.0.1"
  name                    = var.name
  dynamodb_read_capacity  = var.dynamodb_read_capacity
  dynamodb_write_capacity = var.dynamodb_write_capacity
  s3_versioning           = var.s3_versioning
  force_destroy           = var.force_destroy
}

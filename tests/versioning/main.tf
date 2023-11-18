terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

module "main" {
  source                  = "../.."
  dynamodb_read_capacity  = "10"
  dynamodb_write_capacity = "10"
  s3_versioning           = "Enabled"
  force_destroy           = true
}

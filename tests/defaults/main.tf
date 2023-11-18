terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

module "main" {
  for_each = {
    default = { name = null }
    hello   = { name = "hello" }
  }
  source        = "../.."
  name          = each.value["name"]
  force_destroy = true
}

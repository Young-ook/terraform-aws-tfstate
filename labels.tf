resource "random_string" "suffix" {
  length  = 5
  upper   = false
  lower   = true
  number  = false
  special = false
}

locals {
  bucket-name = join("-", compact([var.name, "tfstate", random_string.suffix.result]))
  table-name  = join("-", compact([var.name, "tflock", random_string.suffix.result]))

  bucket-nametag = { "Name" = local.bucket-name }
  table-nametag  = { "Name" = local.table-name }
  default-tags = merge(
    { "terraform.io" = "managed" },
  )
}

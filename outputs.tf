### outputs

locals {
  backend_config = <<-EOT
  terraform {
    backend "s3" {
      region = "${module.aws.region.name}"
      bucket = "${module.terraform-state.bucket.id}"
      key    = "state"
    }
  }
  EOT
}

output "backend" {
  description = "Terraform state backend configuration"
  value       = local.backend_config
}

### terraform state backend configuration file
resource "local_file" "backend" {
  content         = local.backend_config
  filename        = "${path.cwd}/backend.tf"
  file_permission = "0600"
}

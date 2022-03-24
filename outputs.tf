output "backend" {
  description = "Terraform state backend configuration"
  value       = <<-EOT
  terraform {
    backend "s3" {
      region = "${module.aws.region.name}"
      bucket = "${module.terraform-state.bucket.id}"
      key    = "state"
    }
  }
  EOT
}

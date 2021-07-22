output "backend" {
  description = "Terraform state backend configuration"
  value = <<-EOT
  terraform {
    backend "s3" {
      region = "${local.aws_region}"
      bucket = "${local.bucket_name}"
      key    = "state"
    }
  }
  EOT
}

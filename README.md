# Terraform Backend on AWS
Each Terraform configuration can specify a backend, which defines where and how operations are performed, where [state](https://www.terraform.io/docs/language/state/index.html) snapshots are stored, etc. Backend configuration is only used by Terraform CLI.

There are two areas of Terraform's behavior that are determined by the backend:
+ Where state is stored.
+ Where operations are performed.

## Recommended Backends
+ If you are still learning how to use Terraform, we recommend using the default local backend, which requires no configuration.
+ If you and your team are using Terraform to manage meaningful infrastructure, we recommend using the [remote backend](https://www.terraform.io/docs/language/settings/backends/remote.html).

## Examples
- [Terraform Backend Type: S3](https://github.com/Young-ook/terraform-aws-tfstate-backend/blob/main/examples/backend)

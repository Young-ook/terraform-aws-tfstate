# aws partitions
module "aws" {
  source = "Young-ook/spinnaker/aws//modules/aws-partitions"
}

# database/dynamodb
# table for lock info storage
resource "aws_dynamodb_table" "terraform-lock" {
  name           = local.table-name
  tags           = merge(local.table-nametag, local.default-tags, var.tags)
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    ignore_changes = [read_capacity, write_capacity]
  }
}

# storage/s3
# object storage for storing terraform state
module "terraform-state" {
  source        = "Young-ook/sagemaker/aws//modules/s3"
  version       = "0.1.0"
  name          = local.bucket-name
  tags          = merge(local.bucket-nametag, local.default-tags, var.tags)
  versioning    = var.s3_versioning
  force_destroy = var.force_destroy
}

# security/policy
resource "aws_s3_bucket_policy" "bucket-policy" {
  depends_on = [module.terraform-state]
  bucket     = module.terraform-state.bucket.id
  policy = jsonencode({
    Statement = [{
      Action = [
        "s3:ListBucket",
        "s3:GetObject",
      ]
      Effect = "Allow"
      Resource = [
        module.terraform-state.bucket.arn,
        join("/", [module.terraform-state.bucket.arn, "*"]),
      ]
      Principal = {
        AWS = flatten([module.aws.caller.account_id, ])
      }
    }]
    Version = "2012-10-17"
  })
}

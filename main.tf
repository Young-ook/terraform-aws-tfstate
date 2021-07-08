# DynamoDB table for lock info storage
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

# S3 bucket for storing terraform state
resource "aws_s3_bucket" "terraform-state" {
  bucket = local.bucket-name
  tags   = merge(local.bucket-nametag, local.default-tags, var.tags)

  versioning {
    enabled = true
  }
}

data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

# security/policy
resource "aws_s3_bucket_public_access_block" "block-public" {
  bucket                  = aws_s3_bucket.terraform-state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  depends_on = [aws_s3_bucket_public_access_block.block-public]
  bucket     = aws_s3_bucket.terraform-state.id
  policy = jsonencode({
    Statement = [{
      Action = [
        "s3:ListBucket",
        "s3:GetObject",
      ]
      Effect = "Allow"
      Resource = [
        format("arn:%s:s3:::%s/*", data.aws_partition.current.partition, local.bucket-name),
        format("arn:%s:s3:::%s", data.aws_partition.current.partition, local.bucket-name),
      ]
      Principal = {
        AWS = flatten([
          data.aws_caller_identity.current.account_id,
        ])
      }
    }]
    Version = "2012-10-17"
  })
}

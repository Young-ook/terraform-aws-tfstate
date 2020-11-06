output "backend" {
  description = "Terraform state backend"
  value = {
    bucket_name         = aws_s3_bucket.terraform-state.id
    bucket_arn          = aws_s3_bucket.terraform-state.arn
    dynamodb_table_name = aws_dynamodb_table.terraform-lock.id
    dynamodb_table_arn  = aws_dynamodb_table.terraform-lock.arn
  }
}

variable "aws_region" {
  default = "us-east-1"
}

variable "name" {
  description = "The resource name for terraform backend"
  type        = string
}

variable "dynamodb_read_capacity" {
  description = "The read_capacity value for the DynamoDB table to store lock object"
  type        = number
  default     = 5
}

variable "dynamodb_write_capacity" {
  description = "The write_capacity value for the DynamoDB table to store lock object"
  type        = number
  default     = 5
}

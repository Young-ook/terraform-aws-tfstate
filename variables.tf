### terraform backend
variable "name" {
  description = "The resource name for terraform backend"
  type        = string
  default     = "tfbackend"
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

### tags
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}

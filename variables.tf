### terraform backend
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

variable "s3_versioning" {
  description = "A configuration to enable object version control"
  type        = string
  default     = null
  validation {
    condition     = var.s3_versioning == null ? true : contains(["Enabled", "Suspended"], var.s3_versioning)
    error_message = "Allowed values: `Enabled`, `Suspended`."
  }
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted without error"
  type        = bool
  default     = false
}

### description
variable "name" {
  description = "The resource name"
  type        = string
  default     = null
}

### tags
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}

### terraform backend
variable "dynamodb_read_capacity" {
  description = "Amazon DynamoDB read capacity value for lock object"
  type        = number
  default     = 5
}

variable "dynamodb_write_capacity" {
  description = "Amazon DynamoDB write capacity value for lock object"
  type        = number
  default     = 5
}

variable "s3_versioning" {
  description = "Enable object version control"
  type        = string
  default     = null
  validation {
    condition     = var.s3_versioning == null ? true : contains(["Enabled", "Suspended"], var.s3_versioning)
    error_message = "Allowed values: `Enabled`, `Suspended`."
  }
}

variable "force_destroy" {
  description = "Allow to delete all objects without error"
  type        = bool
  default     = false
}

variable "generate_config_file" {
  description = "Allow to create a terraform backend configuration file"
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

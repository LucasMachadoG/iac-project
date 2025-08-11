variable "s3_bucket_name" {
  type        = string
  description = "Base name for the S3 bucket"
}

variable "s3_tags" {
  type        = map(string)
  description = "Tags to apply to the S3 bucket"
  default     = {}
}

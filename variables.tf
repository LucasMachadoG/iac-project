variable "state_bucket" {
  type        = string
  description = "State bucket"
}

variable "s3_bucket_name" {
  type        = string
  description = "Bucket name"
}

variable "s3_tags" {
  type        = map(string)
  default     = {}
  description = "Creative Tags"
}

variable "cdn_price_class" {
  type        = string
  default     = "PriceClass_200"
  description = "CDN Price Class"
}

variable "cdn_tags" {
  type        = map(string)
  default     = {}
  description = "Creative Tags"
}

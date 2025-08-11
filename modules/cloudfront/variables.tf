variable "origin_id" {
  type        = string
  description = "Bucket id"
}

variable "bucket_domain_name" {
  type        = string
  description = "Bucket domain name"
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

output "bucket_domain_name" {
  value       = module.s3.bucket_domain_name
  sensitive   = false
  description = "Bucket domain name"
}

output "cdn_domain" {
  value       = module.cloudfront.cloudfront_domain_name
  sensitive   = false
  description = "Cloudfront id"
}

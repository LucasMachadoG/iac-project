output "cloudfront_domain_name" {
  value       = aws_cloudfront_distribution.cloudfront.domain_name
  sensitive   = false
  description = "Cloudfront domain name"
}

output "cloudfront_id" {
  value       = aws_cloudfront_distribution.cloudfront.id
  sensitive   = false
  description = "Cloudfront id"
}

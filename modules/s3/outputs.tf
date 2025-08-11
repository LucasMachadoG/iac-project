output "bucket_domain_name" {
  value       = aws_s3_bucket.bucket.bucket_domain_name
  description = "S3 bucket domain name"
}

output "bucket_id" {
  value       = aws_s3_bucket.bucket.id
  description = "S3 bucket id"
}

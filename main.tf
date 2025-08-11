module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = var.s3_bucket_name
  s3_tags        = var.s3_tags
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  origin_id          = module.s3.bucket_id
  bucket_domain_name = module.s3.bucket_domain_name
  cdn_price_class    = var.cdn_price_class
  cdn_tags           = var.cdn_tags
}

module "sqs" {
  source     = "terraform-aws-modules/sqs/aws"
  name       = "iac-sqs"
  create_dlq = true
  tags       = var.cdn_tags
}

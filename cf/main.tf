module "cdn" {
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-cloudfront?ref=a0f0506106a4c8815c1c32596e327763acbef2c2"

  aliases                   = var.cdn_aliases
  comment                   = var.cdn_comment
  enabled                   = var.cdn_enabled
  is_ipv6_enabled           = var.cdn_is_ipv6_enabled
  price_class               = var.cdn_price_class

  create_origin_access_identity = true

  origin = {
    angular_s3 = {
      domain_name = var.cdn_s3_bucket_domain
      s3_origin_config = {
        origin_access_identity = module.cdn.origin_access_identity_path
      }
    }
  }

  default_cache_behavior = {
    target_origin_id           = "angular_s3"
    viewer_protocol_policy     = var.cdn_viewer_protocol_policy
    allowed_methods            = var.allowed_methods
    cached_methods             = var.cached_methods
    compress                   = true
    query_string               = var.cdn_query_string
  }

}
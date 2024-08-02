resource "aws_cloudfront_origin_access_control" "oaci" {
  count                             = var.create_origin_access_control ? 1 : 0
  name                              = module.meta.name
  description                       = module.meta.name
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}


resource "aws_cloudfront_distribution" "cf" {
  origin {
    domain_name              = var.s3_endpoint
    origin_id                = var.origin_id
    origin_access_control_id = var.create_origin_access_control ? aws_cloudfront_origin_access_control.oaci[0].id : null
    dynamic "custom_origin_config" {
      for_each = var.create_origin_access_control ? [] : [1]
      content {
        http_port              = "80"
        https_port             = "443"
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      }
    }
  }

  aliases = var.aliases

  enabled             = var.enabled
  default_root_object = var.create_origin_access_control ? null : var.default_root_object
  web_acl_id          = var.web_acl_id
  default_cache_behavior {
    viewer_protocol_policy = var.viewer_protocol_policy
    compress               = var.compress
    allowed_methods        = var.methods
    cached_methods         = var.methods
    target_origin_id       = var.origin_id

    forwarded_values {
      query_string = var.query_string
      cookies {
        forward = var.forward
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = var.ssl_support_method
    cloudfront_default_certificate = var.cloudfront_default_certificate
  }
}

# resource "aws_route53_record" "record" {
#   provider = aws.extra
#   zone_id  = var.zone_id
#   name     = var.name
#   type     = var.type

#   alias {
#     name                   = aws_cloudfront_distribution.cf.domain_name
#     zone_id                = aws_cloudfront_distribution.cf.hosted_zone_id
#     evaluate_target_health = false
#   }
# }
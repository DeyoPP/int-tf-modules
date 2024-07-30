# resource "aws_cloudfront_distribution" "cf_www" {
#   origin {
#     domain_name = var.s3_endpoint_www
#     origin_id   = var.origin_id_www

#     custom_origin_config {
#       http_port              = "80"
#       https_port             = "443"
#       origin_protocol_policy = "http-only"
#       origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
#     }
#   }

#   aliases             = var.www_aliases
#   web_acl_id          = var.web_acl_id
#   enabled             = var.enabled
#   default_root_object = var.default_root_object

#   default_cache_behavior {
#     viewer_protocol_policy = var.viewer_protocol_policy
#     compress               = var.compress
#     allowed_methods        = var.methods
#     cached_methods         = var.methods
#     target_origin_id       = var.origin_id_www

#     forwarded_values {
#       query_string = var.query_string
#       cookies {
#         forward = var.forward
#       }
#     }
#   }

#   restrictions {
#     geo_restriction {
#       restriction_type = var.restriction_type
#     }
#   }

#   viewer_certificate {
#     acm_certificate_arn            = var.acm_certificate_arn
#     ssl_support_method             = var.ssl_support_method
#     cloudfront_default_certificate = var.cloudfront_default_certificate
#   }

#   custom_error_response {
#     error_caching_min_ttl = 10
#     error_code            = 403
#     response_code         = 403
#     response_page_path    = "/404.html"
#   }

#   custom_error_response {
#     error_caching_min_ttl = 10
#     error_code            = 404
#     response_code         = 404
#     response_page_path    = "/404.html"
#   }

# }


# resource "aws_cloudfront_distribution" "cf" {
#   origin {
#     domain_name = var.s3_endpoint
#     origin_id   = var.origin_id

#     custom_origin_config {
#       http_port              = "80"
#       https_port             = "443"
#       origin_protocol_policy = "http-only"
#       origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
#     }
#   }

#   aliases             = var.aliases
#   web_acl_id          = var.web_acl_id
#   enabled             = var.enabled
#   default_root_object = var.default_root_object

#   default_cache_behavior {
#     viewer_protocol_policy = var.viewer_protocol_policy
#     compress               = var.compress
#     allowed_methods        = var.methods
#     cached_methods         = var.methods
#     target_origin_id       = var.origin_id

#     forwarded_values {
#       query_string = var.query_string
#       cookies {
#         forward = var.forward
#       }
#     }
#   }

#   restrictions {
#     geo_restriction {
#       restriction_type = var.restriction_type
#     }
#   }

#   viewer_certificate {
#     acm_certificate_arn            = var.acm_certificate_arn
#     ssl_support_method             = var.ssl_support_method
#     cloudfront_default_certificate = var.cloudfront_default_certificate
#   }
# }

# resource "aws_route53_record" "www_record" {
#   provider = aws.extra
#   zone_id  = var.zone_id
#   name     = var.www_name
#   type     = var.type

#   alias {
#     name                   = aws_cloudfront_distribution.cf_www.domain_name
#     zone_id                = aws_cloudfront_distribution.cf_www.hosted_zone_id
#     evaluate_target_health = false
#   }
# }

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
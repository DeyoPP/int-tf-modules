data "aws_route53_zone" "selected" {
  provider = aws.eu-central
  name         = var.domain_name
  private_zone = false
}

resource "aws_acm_certificate" "cert" {
  provider         = aws.us-east
  domain_name      = var.domain_name
  validation_method = "DNS"

  subject_alternative_names = var.aliases
  
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "CloudFrontCertificate"
  }
}

resource "aws_route53_record" "cert_validation" {
  provider = aws.eu-central

  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      type    = dvo.resource_record_type
      value   = dvo.resource_record_value
      zone_id = data.aws_route53_zone.selected.zone_id
    }
  }

  zone_id = each.value.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cert_validation" {
  provider = aws.us-east

  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

resource "aws_cloudfront_origin_access_control" "oaci" {
  provider = aws.eu-central
  count                             = var.create_origin_access_control ? 1 : 0
  name                              = var.oaci_name
  description                       = var.oaci_description
  origin_access_control_origin_type = var.oaci_origin_type
  signing_behavior                  = var.oaci_signing_behavior
  signing_protocol                  = var.oaci_signing_protocol
}

resource "aws_cloudfront_distribution" "cf" {
  provider = aws.eu-central

  #checkov:skip=CKV_AWS_86
  #checkov:skip=CKV_AWS_68
  #checkov:skip=CKV_AWS_305
  #checkov:skip=CKV_AWS_310
  #checkov:skip=CKV2_AWS_47
  #checkov:skip=CKV2_AWS_32

  origin {
    domain_name              = var.s3_endpoint
    origin_id                = var.origin_id
    origin_access_control_id = var.create_origin_access_control ? aws_cloudfront_origin_access_control.oaci[0].id : null
    dynamic "custom_origin_config" {
      for_each = var.create_origin_access_control ? [] : [1]
      content {
        http_port              = "80"
        https_port             = "443"
        origin_protocol_policy = "redirect-to-https"
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
    acm_certificate_arn            = aws_acm_certificate.cert.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2019"
    cloudfront_default_certificate = false
  }
}

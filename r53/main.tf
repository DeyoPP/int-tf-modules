resource "aws_route53_zone" "example" {
#checkov:skip=CKV2_AWS_38
#checkov:skip=CKV2_AWS_39

  name = var.route53_zone_name
}

resource "aws_route53_record" "www_dejan_fornul_io" {
  zone_id = aws_route53_zone.example.zone_id
  name    = "www.dejan.fornul.io"
  type    = "CNAME"
  ttl     = 300

  records = [
    var.cloudfront_distribution_domain
  ]
}

resource "aws_route53_record" "api_dejan_fornul_io" {
  zone_id = aws_route53_zone.example.zone_id
  name    = "api.dejan.fornul.io"
  type    = "A"
  ttl     = 300

  records = [
    var.api_ip_address
  ]
}

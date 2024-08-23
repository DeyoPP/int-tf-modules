variable "route53_zone_name" {
  description = "The name of the Route 53 hosted zone"
  type        = string
}

variable "cloudfront_distribution_domain" {
  description = "The domain name of the CloudFront distribution"
  type        = string
}

variable "api_ip_address" {
  description = "The IP address or alias for the API"
  type        = string
}

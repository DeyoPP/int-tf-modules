variable "cdn_aliases" {
  description = "Aliases for the CloudFront distribution"
  type        = list(string)
}

variable "cdn_comment" {
  description = "Comment for the CloudFront distribution"
  type        = string
  default = ""
}

variable "cdn_enabled" {
  description = "Enable or disable the CloudFront distribution"
  type        = bool
  default     = true
}

variable "cdn_is_ipv6_enabled" {
  description = "Enable or disable IPv6 for the CloudFront distribution"
  type        = bool
  default     = true
}

variable "cdn_price_class" {
  description = "Price class for the CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}

variable "cdn_certificate_arn" {
  description = "ARN of the ACM certificate for CloudFront"
  type        = string
}

variable "cdn_s3_bucket_domain" {
  description = "Domain name of the S3 bucket"
  type        = string
}

variable "cdn_viewer_protocol_policy" {
  description = "Viewer protocol policy"
  type        = string
  default     = "redirect-to-https"
}

variable "cdn_query_string" {
  description = "Enable or disable caching based on query strings"
  type        = bool
  default     = false
}

variable "cdn_allowed_methods" {
  description = "Allowed HTTP methods for the CloudFront distribution"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cdn_cached_methods" {
  description = "Cached HTTP methods for the CloudFront distribution"
  type        = list(string)
  default     = ["GET", "HEAD"]
}
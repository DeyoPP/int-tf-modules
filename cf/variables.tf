variable "domain_name" {
  description = "The domain name for the certificate."
  type        = string
}

variable "aliases" {
  description = "A list of CNAMEs (aliases) to associate with the distribution."
  type        = list(string)
}

variable "s3_endpoint" {
  description = "The S3 endpoint for the CloudFront origin."
  type        = string
}

variable "origin_id" {
  description = "The ID of the origin."
  type        = string
}

variable "create_origin_access_control" {
  description = "Flag to create an origin access control."
  type        = bool
  default     = true
}

variable "enabled" {
  description = "Flag to enable the CloudFront distribution."
  type        = bool
  default     = true
}

variable "default_root_object" {
  description = "The default root object."
  type        = string
  default     = "index.html"
}

variable "web_acl_id" {
  description = "The ID of the AWS WAF WebACL."
  type        = string
  default     = ""
}

variable "viewer_protocol_policy" {
  description = "The viewer protocol policy for the default cache behavior."
  type        = string
  default     = "redirect-to-https"
}

variable "compress" {
  description = "Flag to enable compression."
  type        = bool
  default     = true
}

variable "methods" {
  description = "The allowed methods for the default cache behavior."
  type        = list(string)
  default     = ["GET", "HEAD", "OPTIONS"]
}

variable "query_string" {
  description = "Flag to forward query strings."
  type        = bool
  default     = false
}

variable "forward" {
  description = "The cookies to forward."
  type        = string
  default     = "none"
}

variable "restriction_type" {
  description = "The restriction type for geo restriction."
  type        = string
  default     = "none"
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate."
  type        = string
  default     = ""
}

variable "ssl_support_method" {
  description = "The SSL support method for the viewer certificate."
  type        = string
  default     = "sni-only"
}

variable "cloudfront_default_certificate" {
  description = "Flag to use the default CloudFront certificate."
  type        = bool
  default     = false
}

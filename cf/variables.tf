variable "meta" {
  type = object({
    owner    = string
    basename = string
    suffix   = string
  })
}

variable "aliases" {
  description = "CNAME for our website"

  type = list(string)
}

variable "www_aliases" {
  description = "CNAME for our website"

  type = list(string)
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "s3_endpoint" {
  description = ""
  type        = string
}

variable "origin_id" {
  description = ""
  type        = string
}

variable "s3_endpoint_www" {
  description = ""
  type        = string
}

variable "origin_id_www" {
  description = ""
  type        = string
}

variable "enabled" {
  description = ""
  type        = bool
}

variable "default_root_object" {
  description = ""
  type        = string
}

variable "viewer_protocol_policy" {
  description = ""
  type        = string
}

variable "compress" {
  description = ""
  type        = bool
}

variable "methods" {
  description = ""
  type        = list(string)
}

variable "query_string" {
  description = ""
  type        = bool
}

variable "forward" {
  description = ""
  type        = string
}

variable "restriction_type" {
  description = ""
  type        = string
}

variable "acm_certificate_arn" {
  description = ""
  type        = string
}

variable "ssl_support_method" {
  description = ""
  type        = string
}

variable "cloudfront_default_certificate" {
  description = ""
  type        = bool
}

variable "zone_id" {
  type = string
}

variable "name" {
  type = string
}

variable "www_name" {
  type = string
}

variable "type" {
  type = string
}

variable "web_acl_id" {
  description = "ACL ID of WAF"
  type        = string
}
variable "domain_name" {
  description = "The domain name for the ACM certificate."
  type        = string
}

variable "s3_endpoint" {
  description = "The endpoint of the S3 bucket."
  type        = string
}

variable "origin_id" {
  description = "The ID for the CloudFront origin."
  type        = string
}

variable "create_origin_access_control" {
  description = "Flag to create origin access control."
  type        = bool
  default     = true
}

variable "aliases" {
  description = "A list of aliases for the CloudFront distribution."
  type        = list(string)
}

variable "enabled" {
  description = "Enable the CloudFront distribution."
  type        = bool
  default     = true
}

variable "default_root_object" {
  description = "The default root object for the CloudFront distribution."
  type        = string
  default     = "index.html"
}

variable "web_acl_id" {
  description = "The ID of the Web ACL to associate with the CloudFront distribution."
  type        = string
  default     = ""
}

variable "viewer_protocol_policy" {
  description = "The protocol policy for viewers."
  type        = string
  default     = "redirect-to-https"
}

variable "compress" {
  description = "Whether CloudFront will compress content."
  type        = bool
  default     = true
}

variable "methods" {
  description = "A list of HTTP methods allowed for the default cache behavior."
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "query_string" {
  description = "Whether to forward query strings to the origin."
  type        = bool
  default     = false
}

variable "forward" {
  description = "Specifies how cookies are forwarded to the origin."
  type        = string
  default     = "none"
}

variable "restriction_type" {
  description = "The restriction type for geo restrictions."
  type        = string
  default     = "none"
}

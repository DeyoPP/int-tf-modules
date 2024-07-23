variable "region" {
  type    = string
  default = ""
}

variable "bucket_name" {
  type    = string
  default = ""
}

variable "versioning_enabled" {
  type    = bool
  default = false
}

variable "force_destroy" {
  type    = bool
  default = false
}

variable "attach_policy" {
  type    = bool
  default = false
}

variable "policy" {
  type    = string
  default = ""
}

variable "website" {
  type    = map(any)
  default = {}
}

variable "acl" {
  type    = string
  default = "private"
}

variable "cors_rule" {
  type        = list(any)
  description = "List of CORS rules"
  default     = []
}

variable "control_object_ownership" {
  type = bool
}

variable "object_ownership" {
  type = string
}

variable "custom_policy" {
  description = "Custom S3 bucket policy in JSON format"
  type        = string
  default     = ""
}

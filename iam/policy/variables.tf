variable "env" {
  description = "Relevant environment metadata passed in by terragrunt by default"
  type = object({
    name       = string
    account_id = string
    region     = string
  })
}

variable "meta" {
  type = object({
    owner    = string
    basename = string
    suffix   = string
  })
}

variable "create_policy" {
  description = "Whether to create the IAM policy"
  type        = bool
  default     = true
}

variable "path" {
  description = "The path of the policy in IAM"
  type        = string
  default     = "/"
}

variable "description" {
  description = "The description of the policy"
  type        = string
  default     = "IAM Policy"
}

variable "policy" {
  description = "The path of the policy in IAM (tpl file)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
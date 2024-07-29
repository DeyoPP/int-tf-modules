variable "region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-east-1"
}

variable "repository_name" {
  description = "The name of the ECR repository."
  type        = string
}

variable "image_tag_mutability" {
  description = "The image tag mutability setting for the repository."
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Whether to scan images on push."
  type        = bool
  default     = false
}

variable "policy" {
  description = "The JSON policy to apply to the repository."
  type        = string
  default     = "{}"
}

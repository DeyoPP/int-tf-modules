variable "chart_version" {
  type    = string
  default = "0.9.5"
}

variable "aws_region" {
  type        = string
  description = "AWS region for the secrets"
}

variable "eks_oidc_provider_arn" {
  type        = string
  description = "EKS Cluster OIDC provider ARN"
}
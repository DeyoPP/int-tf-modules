variable "chart_version" {
  type    = string
  default = "0.9.5"
}

variable "eks_oidc_provider_arn" {
  type        = string
  description = "EKS Cluster oidc provider arn"
}

variable "service_account_name" {
  description = "Name of the service account"
  type        = string
}

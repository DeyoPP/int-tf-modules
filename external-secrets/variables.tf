# Define variables
variable "external_secrets_name" {
  default = "external-secrets"
}

variable "external_secrets_repository" {
  default = "https://charts.external-secrets.io"
}

variable "external_secrets_chart" {
  default = "external-secrets"
}

variable "external_secrets_version" {
  default = "0.8.0"
}

variable "namespace" {

}

variable "install_crds" {
  default = "true"
}

variable "service_account_create" {
  default = "false"
}

variable "service_account_name" {
  default = "external-secrets-sa"
}

variable "role_arn" {
  default = "arn:aws:iam::976552365380:role/karpenter-eks-node-group-20240820074628272500000001"
}

variable "secret_store_manifest" {
  description = "YAML configuration for Secret Store"
  type        = string
}

variable "external_secret_manifest" {
  description = "YAML configuration for External Secrets"
  type        = string
}
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

variable "secret_store_name" {
  default = "aws-secrets-manager"
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "external_secret_name" {
  default = "my-external-secret"
}

variable "refresh_interval" {
  default = "15m"
}

variable "remote_secret_key" {
  default = "explorer_db_values"
}

variable "postgres_user_property" {
  default = "username"
}

variable "postgres_password_property" {
  default = "password"
}

variable "postgres_db_property" {
  default = "db_name"
}

variable "postgres_host_property" {
  default = "host"
}

variable "postgres_port_property" {
  default = "port"
}


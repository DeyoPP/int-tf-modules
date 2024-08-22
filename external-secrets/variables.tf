variable "aws_region" {
  description = "AWS region to use"
  type        = string
  default = "eu-central-1"
}

variable "secret_name" {
  description = "Name of the AWS Secrets Manager secret"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for the secret"
  type        = string
}


variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "region" {
  description = "The AWS region where the EKS cluster is located"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the ALB Ingress Controller will be deployed"
  type        = string
}

variable "oidc_provider" {
  description = "The OIDC provider ARN for the EKS cluster"
  type = string
  default   = ""
}

variable "oidc_url" {
  description = "The OIDC provider URL for the EKS cluster"
  type = string
  default   = ""
}

variable "namespace" {
  description = "The Kubernetes namespace where the external-dns will be deployed"
  type        = string
  default     = "kube-system"
}

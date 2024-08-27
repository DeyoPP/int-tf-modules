variable "namespace" {
  description = "The Kubernetes namespace where the external-dns will be deployed"
  type        = string
  default     = "kube-system"
}

variable "zone_type" {
  description = "The type of Route53 zone to manage (public or private)"
  type        = string
  default     = "public"
}

variable "policy" {
  description = "The policy for managing DNS records (e.g., upsert-only, sync)"
  type        = string
  default     = "upsert-only"
}

variable "registry" {
  description = "The registry type for managing ownership (e.g., txt)"
  type        = string
  default     = "txt"
}

variable "region" {
  description = "The AWS region where the resources are located"
  type        = string
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
}

variable "domain_filter" {
  description = "The domain filter for restricting DNS management to a specific domain"
  type        = string
}

variable "sources" {
  description = "The sources for DNS records (e.g., service, ingress)"
  type        = string
  default     = "service,ingress"
}

variable "txt_prefix" {
  description = "The prefix used for TXT records"
  type        = string
  default     = "_external-dns"
}

variable "hosted_zone_id" {
  description = "The ID of the Route 53 hosted zone"
  type        = string
  default     = ""
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
variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
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

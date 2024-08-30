variable "namespace" {
  description = "The Kubernetes namespace where the external-dns will be deployed"
  type        = string
  default     = "kube-system"
}

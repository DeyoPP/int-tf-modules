variable "namespace" {
  description = "Kubernetes namespace for ArgoCD"
  type        = string
  default     = "argocd"
}

variable "argo_cd_chart_version" {
  description = "Version of the ArgoCD Helm chart"
  type        = string
  default     = "5.25.2"
}

variable "repository_url" {
  description = "URL of the Helm repository for ArgoCD"
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

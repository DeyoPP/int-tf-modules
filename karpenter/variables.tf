variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "ecr_repo_username" {
  description = "The username for the ECR repository"
  type        = string
}

variable "ecr_repo_password" {
  description = "The password for the ECR repository"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
  default     = {}
}

variable "cluster_endpoint" {
  description = "The endpoint URL of the EKS cluster"
  type        = string
}

variable "karpenter_node_pool_config" {
  description = "Path to the YAML configuration for Karpenter Node Pool"
  type        = string
}


variable "karpenter_version" {
  description = "Version of the Karpenter Helm chart"
  type        = string
  default     = "0.37.0"  # Default version
}

variable "karpenter_namespace" {
  description = "Namespace for Karpenter resources"
  type        = string
  default     = "kube-system"  # Default namespace
}

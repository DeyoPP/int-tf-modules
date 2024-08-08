variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be created."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the EKS cluster will be created."
  type        = list(string)
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
  default     = {}
}

variable "enable_cluster_creator_admin_permissions" {
  description = "Whether to give Terraform identity admin access to the cluster."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Whether to enable public access to the EKS cluster endpoint."
  type        = bool
  default     = true
}

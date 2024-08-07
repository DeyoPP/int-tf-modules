variable "name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.30"
}

variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "intra_subnets" {
  description = "List of intra subnet IDs for the EKS cluster control plane"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "ami_type" {
  description = "The AMI type for the managed node group"
  type        = string
  default     = "AL2023_x86_64_STANDARD"
}

variable "instance_types" {
  description = "Comma-separated list of instance types for the managed node group"
  type        = string
  default     = "t3.medium"
}

variable "min_size" {
  description = "Minimum size of the managed node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of the managed node group"
  type        = number
  default     = 3
}

variable "desired_size" {
  description = "Desired size of the managed node group"
  type        = number
  default     = 1
}

variable "taint_key" {
  description = "The key for the taint applied to the managed node group"
  type        = string
  default     = "CriticalAddonsOnly"
}

variable "taint_value" {
  description = "The value for the taint applied to the managed node group"
  type        = string
  default     = "true"
}

variable "taint_effect" {
  description = "The effect of the taint applied to the managed node group"
  type        = string
  default     = "NO_SCHEDULE"
}

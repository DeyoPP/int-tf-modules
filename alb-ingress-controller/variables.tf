
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
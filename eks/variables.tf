variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "cluster_service_ipv4_cidr" {
  description = "Cluster service CIDR block"
  type        = string
}

variable "aws_auth_roles" {
  description = "AWS IAM roles for authentication"
  type        = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "aws_auth_users" {
  description = "AWS IAM users for authentication"
  type        = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "aws_auth_accounts" {
  description = "AWS accounts for authentication"
  type        = list(string)
  default = []
}

variable "cloudwatch_log_group_retention_in_days" {
  description = "CloudWatch log group retention in days"
  type        = number
}

variable "cluster_enabled_log_types" {
  description = "List of cluster enabled log types"
  type        = list(string)
}

variable "node_additional_security_group_rules" {
  description = "Additional security group rules for nodes"
  type        = map(object({
    description = string
    protocol    = string
    from_port   = number
    to_port     = number
    type        = string
    self        = bool
    cidr_blocks = list(string)
    ipv6_cidr_blocks = list(string)
  }))
  default = {}
}

variable "create_iam_role" {
  description = "Whether to create an IAM role for the EKS cluster"
  type        = bool
}

variable "iam_role_arn" {
  description = "IAM role ARN if not creating a new one"
  type        = string
}

variable "ebs_csi_version" {
  description = "Version of the EBS CSI driver addon"
  type        = string
}

variable "ebs_csi_irsa_role_arn" {
  description = "IAM role ARN for the EBS CSI driver"
  type        = string
}

variable "vpc_cni_version" {
  description = "Version of the VPC CNI addon"
  type        = string
}

variable "vpc_cni_irsa_role_arn" {
  description = "IAM role ARN for the VPC CNI"
  type        = string
}

variable "kube_proxy_version" {
  description = "Version of the kube-proxy addon"
  type        = string
}

variable "coredns_version" {
  description = "Version of the CoreDNS addon"
  type        = string
}

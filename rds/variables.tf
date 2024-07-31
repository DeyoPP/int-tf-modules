variable "db_identifier" {
  description = "The identifier for the DB instance"
  type        = string
}

variable "sg_name" {
  description = "The name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for security group ingress"
  type        = string
}

variable "additional_cidr_block" {
  description = "Additional CIDR block for security group ingress"
  type        = string
}

variable "owner_tag" {
  description = "The owner tag for resources"
  type        = string
}

variable "environment_tag" {
  description = "The environment tag for resources"
  type        = string
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled for the DB instance"
  type        = bool
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "parameters" {
  description = "The DB parameters"
  type        = map(string)
}

variable "options" {
  description = "The DB options"
  type        = map(string)
}

variable "secret_name" {
  description = "The name of the secrets manager secret"
  type        = string
}

variable "password_special" {
  description = "Whether the generated password should include special characters"
  type        = bool
}

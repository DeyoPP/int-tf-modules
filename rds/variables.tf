variable "meta" {
  type = object({
    owner    = string
    basename = string
    suffix   = string
  })
}

variable "parameters" {
  type        = list(map(any))
  description = "Database parameters"
  default     = []
}

variable "options" {
  type        = list(map(any))
  description = "Database server options"
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}


variable "cidr_block" {
  type        = string
  description = "Cidr block from which access will be allowed"
}

variable "additional_cidr_block" {
  type        = string
  description = "Additional Cidr block from which access will be allowed"
}

variable "deletion_protection" {
  type        = bool
  description = "Protect db from being deleted"
  default     = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet for database"
}

variable "password_special" {
  type        = bool
  description = "Is password special"
  default     = true
}
variable "repository_names" {
  type        = list(string)
  description = "list for repository names"
}
variable "repository_read_write_access_arns" {
  type        = list(string)
  description = "list of ARNs which can read and write"
  default     = []
}

variable "rules" {
  type = list(object({
    rulePriority = number
    description  = string
    selection = object({
      tagStatus     = string
      tagPrefixList = list(string)
      countType     = string
      countNumber   = number
    })
    action = object({
      type = string
    })

  }))
}
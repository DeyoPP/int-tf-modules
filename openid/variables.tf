variable "client_id_list" {
  type        = list(string)
  description = "List of client ids"
}

variable "thumbprint" {
  type        = list(string)
  description = "List of thumbprint list"
}


variable "github_url" {
  type        = string
  default     = "https://token.actions.githubusercontent.com"
  description = "List of thumbprint list"
}


variable "max_session_duration" {
  type        = string
  default     = "21600" # 6 hours
  description = "Max session duration that can be requested for the role"
}


variable "role_map" {
  type        = any
  description = "Audience value for AWS Identity provider always equal to https://gitlab.com for Gitlab."
}
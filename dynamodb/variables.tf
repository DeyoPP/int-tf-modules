variable "meta" {
  type = object({
    owner    = string
    basename = string
    suffix   = string
  })
}

variable "read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than"
  type        = number
  default     = 5
}
variable "write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than"
  type        = number
  default     = 5
}

variable "billing_mode" {
  description = "Controls how you are billed for read/write throughput and how you manage capacity. The valid values are PROVISIONED or PAY_PER_REQUEST"
  type        = string
  default     = "PAY_PER_REQUEST"
  validation {
    condition = anytrue([
      var.billing_mode == "PAY_PER_REQUEST",
      var.billing_mode == "PROVISIONED",
    ])
    error_message = "Billing mode must be PAY_PER_REQUEST or PROVISIONED."
  }
}

variable "autoscaling_enabled" {
  type        = bool
  default     = false
  description = "Enable autoscaling of DynamoDB"
}

variable "deletion_protection_enabled" {
  type        = bool
  default     = false
  description = "Enable deletion protection"
}

variable "attributes" {
  type    = list(map(string))
  default = []
}

variable "hash_key" {
  type    = string
  default = ""
}

variable "range_key" {
  type    = string
  default = ""
}

variable "table_name" {
  description = "Optional DynamoDB table name, if not used it will be auto-generated."
  type        = string
  default     = ""
}

variable "point_in_time_recovery_enabled" {
  type    = bool
  default = false
}

variable "global_secondary_indexes" {
  type = list(object({
    name            = string
    hash_key        = string
    range_key       = string
    projection_type = string
    read_capacity   = number
    write_capacity  = number
  }))
  validation {
    condition     = alltrue([for gsi in var.global_secondary_indexes : can(regex("^(ALL|KEYS_ONLY|INCLUDE)$", gsi["projection_type"]))])
    error_message = "Invalid value fr projection_type provided: Please only provide either ALL, KEYS_ONLY, INCLUDE."
  }
  default = []
}

variable "stream_enabled" {
  type        = bool
  default     = false
  description = "Indicates whether Streams are to be enabled (true) or disabled (false)."
}

variable "stream_view_type" {
  type        = string
  default     = null
  description = "When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES."
}

variable "ttl" {
  type        = any
  description = "Configuration block for TTL - time to live"
  default     = {}
}

variable "lambda_arns_to_trigger" {
  type        = list(string)
  default     = []
  description = "Lambda arns to be triggered when on every new item on dynamodb table"
}

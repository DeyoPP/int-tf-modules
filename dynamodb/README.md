<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamodb-table"></a> [dynamodb-table](#module\_dynamodb-table) | git::https://github.com/terraform-aws-modules/terraform-aws-dynamodb-table | 696ceabbfdd49f8246e3d401c035729d60ea6fab |

## Resources

| Name | Type |
|------|------|
| [aws_lambda_event_source_mapping.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | n/a | `list(map(string))` | `[]` | no |
| <a name="input_autoscaling_enabled"></a> [autoscaling\_enabled](#input\_autoscaling\_enabled) | Enable autoscaling of DynamoDB | `bool` | `false` | no |
| <a name="input_billing_mode"></a> [billing\_mode](#input\_billing\_mode) | Controls how you are billed for read/write throughput and how you manage capacity. The valid values are PROVISIONED or PAY\_PER\_REQUEST | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | Enable deletion protection | `bool` | `false` | no |
| <a name="input_global_secondary_indexes"></a> [global\_secondary\_indexes](#input\_global\_secondary\_indexes) | n/a | <pre>list(object({<br>    name            = string<br>    hash_key        = string<br>    range_key       = string<br>    projection_type = string<br>    read_capacity   = number<br>    write_capacity  = number<br>  }))</pre> | `[]` | no |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | n/a | `string` | `""` | no |
| <a name="input_lambda_arns_to_trigger"></a> [lambda\_arns\_to\_trigger](#input\_lambda\_arns\_to\_trigger) | Lambda arns to be triggered when on every new item on dynamodb table | `list(string)` | `[]` | no |
| <a name="input_point_in_time_recovery_enabled"></a> [point\_in\_time\_recovery\_enabled](#input\_point\_in\_time\_recovery\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_range_key"></a> [range\_key](#input\_range\_key) | n/a | `string` | `""` | no |
| <a name="input_read_capacity"></a> [read\_capacity](#input\_read\_capacity) | The number of read units for this table. If the billing\_mode is PROVISIONED, this field should be greater than | `number` | `5` | no |
| <a name="input_stream_enabled"></a> [stream\_enabled](#input\_stream\_enabled) | Indicates whether Streams are to be enabled (true) or disabled (false). | `bool` | `false` | no |
| <a name="input_stream_view_type"></a> [stream\_view\_type](#input\_stream\_view\_type) | When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS\_ONLY, NEW\_IMAGE, OLD\_IMAGE, NEW\_AND\_OLD\_IMAGES. | `string` | `null` | no |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Optional DynamoDB table name, if not used it will be auto-generated. | `string` | `""` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | Configuration block for TTL - time to live | <pre>object({<br>    attribute_name = string<br>    enabled         = bool<br>  })</pre> | <pre>{<br>  "attribute_name": "",<br>  "enabled": false<br>}</pre> | no |
| <a name="input_write_capacity"></a> [write\_capacity](#input\_write\_capacity) | The number of write units for this table. If the billing\_mode is PROVISIONED, this field should be greater than | `number` | `5` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_table_arn"></a> [table\_arn](#output\_table\_arn) | ARN of provisioned DynamoDB table |
| <a name="output_table_name"></a> [table\_name](#output\_table\_name) | Name of provisioned DynamoDB table |
<!-- END_TF_DOCS -->
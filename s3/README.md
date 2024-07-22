<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bucket"></a> [bucket](#module\_bucket) | git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket | 8a0b697adfbc673e6135c70246cff7f8052ad95a |
| <a name="module_meta"></a> [meta](#module\_meta) | ../meta | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | n/a | `string` | `"private"` | no |
| <a name="input_attach_policy"></a> [attach\_policy](#input\_attach\_policy) | n/a | `bool` | `false` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | `""` | no |
| <a name="input_control_object_ownership"></a> [control\_object\_ownership](#input\_control\_object\_ownership) | n/a | `bool` | n/a | yes |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | List of CORS rules | `list(any)` | `[]` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | n/a | `bool` | `false` | no |
| <a name="input_meta"></a> [meta](#input\_meta) | n/a | <pre>object({<br>    owner    = string<br>    basename = string<br>    suffix   = string<br>  })</pre> | n/a | yes |
| <a name="input_object_ownership"></a> [object\_ownership](#input\_object\_ownership) | n/a | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | n/a | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `""` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_website"></a> [website](#input\_website) | n/a | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
<!-- END_TF_DOCS -->
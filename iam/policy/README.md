<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_policy"></a> [iam\_policy](#module\_iam\_policy) | git::https://github.com/terraform-aws-modules/iam//modules/iam-policy | 88435a9dfab0b038fae753ae79dfa1a3bea01710 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_policy"></a> [create\_policy](#input\_create\_policy) | Whether to create the IAM policy | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the policy | `string` | `"IAM Policy"` | no |
| <a name="input_env"></a> [env](#input\_env) | Relevant environment metadata passed in by terragrunt by default | <pre>object({<br>    name       = string<br>    account_id = string<br>    region     = string<br>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `""` | no |
| <a name="input_path"></a> [path](#input\_path) | The path of the policy in IAM | `string` | `"/"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The path of the policy in IAM (tpl file) | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_description"></a> [description](#output\_description) | The description of the policy |
| <a name="output_id"></a> [id](#output\_id) | The policy's ID |
| <a name="output_name"></a> [name](#output\_name) | The name of the policy |
| <a name="output_path"></a> [path](#output\_path) | The path of the policy in IAM |
| <a name="output_policy"></a> [policy](#output\_policy) | The policy document |
<!-- END_TF_DOCS -->
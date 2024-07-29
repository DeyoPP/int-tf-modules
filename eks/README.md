<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The image tag mutability setting for the repository. | `string` | `"MUTABLE"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The JSON policy to apply to the repository. | `string` | `"{}"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to create resources in. | `string` | `"us-east-1"` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the ECR repository. | `string` | n/a | yes |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Whether to scan images on push. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | n/a |
<!-- END_TF_DOCS -->
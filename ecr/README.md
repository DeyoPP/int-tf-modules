<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | git::https://github.com/terraform-aws-modules/terraform-aws-ecr | df965a8501c9256c1893bb9d65fc2c037ffa1257 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_repository_names"></a> [repository\_names](#input\_repository\_names) | list for repository names | `list(string)` | n/a | yes |
| <a name="input_repository_read_write_access_arns"></a> [repository\_read\_write\_access\_arns](#input\_repository\_read\_write\_access\_arns) | list of ARNs which can read and write | `list(string)` | `[]` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | n/a | <pre>list(object({<br>    rulePriority = number<br>    description  = string<br>    selection = object({<br>      tagStatus     = string<br>      tagPrefixList = list(string)<br>      countType     = string<br>      countNumber   = number<br>    })<br>    action = object({<br>      type = string<br>    })<br><br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
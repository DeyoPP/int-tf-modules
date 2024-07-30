<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db"></a> [db](#module\_db) | git::https://github.com/terraform-aws-modules/rds//modules/db_instance | a4ae4a51545f5cb617d30b716f6bf11840c76a0e |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | git::https://github.com/terraform-aws-modules/terraform-aws-security-group | 20e107f1658bc5c8b23efce2e17406e74e6cbeae |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.db_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_secretsmanager_secret.password_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.password_secret_value](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_password.master_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_cidr_block"></a> [additional\_cidr\_block](#input\_additional\_cidr\_block) | Additional Cidr block from which access will be allowed | `string` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Cidr block from which access will be allowed | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Protect db from being deleted | `bool` | `true` | no |
| <a name="input_meta"></a> [meta](#input\_meta) | n/a | <pre>object({<br>    owner    = string<br>    basename = string<br>    suffix   = string<br>  })</pre> | n/a | yes |
| <a name="input_options"></a> [options](#input\_options) | Database server options | `list(map(any))` | `[]` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Database parameters | `list(map(any))` | `[]` | no |
| <a name="input_password_special"></a> [password\_special](#input\_password\_special) | Is password special | `bool` | `true` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet for database | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
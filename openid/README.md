<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.github_ci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume-role-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.github](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id_list"></a> [client\_id\_list](#input\_client\_id\_list) | List of client ids | `list(string)` | n/a | yes |
| <a name="input_github_url"></a> [github\_url](#input\_github\_url) | List of thumbprint list | `string` | `"https://token.actions.githubusercontent.com"` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Max session duration that can be requested for the role | `string` | `"21600"` | no |
| <a name="input_role_map"></a> [role\_map](#input\_role\_map) | Audience value for AWS Identity provider always equal to https://gitlab.com for Gitlab. | `any` | n/a | yes |
| <a name="input_thumbprint"></a> [thumbprint](#input\_thumbprint) | List of thumbprint list | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
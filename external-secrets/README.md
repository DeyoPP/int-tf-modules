<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.external_secrets](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_manifest.external_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.secret_store](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_service_account.external_secrets_sa](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"eu-central-1"` | no |
| <a name="input_external_secret_name"></a> [external\_secret\_name](#input\_external\_secret\_name) | n/a | `string` | `"my-external-secret"` | no |
| <a name="input_external_secrets_chart"></a> [external\_secrets\_chart](#input\_external\_secrets\_chart) | n/a | `string` | `"external-secrets"` | no |
| <a name="input_external_secrets_name"></a> [external\_secrets\_name](#input\_external\_secrets\_name) | Define variables | `string` | `"external-secrets"` | no |
| <a name="input_external_secrets_repository"></a> [external\_secrets\_repository](#input\_external\_secrets\_repository) | n/a | `string` | `"https://charts.external-secrets.io"` | no |
| <a name="input_external_secrets_version"></a> [external\_secrets\_version](#input\_external\_secrets\_version) | n/a | `string` | `"0.8.0"` | no |
| <a name="input_install_crds"></a> [install\_crds](#input\_install\_crds) | n/a | `string` | `"true"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"default"` | no |
| <a name="input_postgres_db_property"></a> [postgres\_db\_property](#input\_postgres\_db\_property) | n/a | `string` | `"db_name"` | no |
| <a name="input_postgres_host_property"></a> [postgres\_host\_property](#input\_postgres\_host\_property) | n/a | `string` | `"host"` | no |
| <a name="input_postgres_password_property"></a> [postgres\_password\_property](#input\_postgres\_password\_property) | n/a | `string` | `"password"` | no |
| <a name="input_postgres_port_property"></a> [postgres\_port\_property](#input\_postgres\_port\_property) | n/a | `string` | `"port"` | no |
| <a name="input_postgres_user_property"></a> [postgres\_user\_property](#input\_postgres\_user\_property) | n/a | `string` | `"username"` | no |
| <a name="input_refresh_interval"></a> [refresh\_interval](#input\_refresh\_interval) | n/a | `string` | `"15m"` | no |
| <a name="input_remote_secret_key"></a> [remote\_secret\_key](#input\_remote\_secret\_key) | n/a | `string` | `"explorer_db_values"` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | n/a | `string` | `"arn:aws:iam::976552365380:role/karpenter-eks-node-group-20240820074628272500000001"` | no |
| <a name="input_secret_store_name"></a> [secret\_store\_name](#input\_secret\_store\_name) | n/a | `string` | `"aws-secrets-manager"` | no |
| <a name="input_service_account_create"></a> [service\_account\_create](#input\_service\_account\_create) | n/a | `string` | `"false"` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | n/a | `string` | `"external-secrets-sa"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace"></a> [namespace](#output\_namespace) | The namespace where External Secrets is deployed. |
| <a name="output_release_name"></a> [release\_name](#output\_release\_name) | The name of the Helm release. |
<!-- END_TF_DOCS -->
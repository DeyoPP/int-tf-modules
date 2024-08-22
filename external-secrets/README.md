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
| <a name="input_external_secret_manifest"></a> [external\_secret\_manifest](#input\_external\_secret\_manifest) | YAML configuration for External Secrets | `string` | n/a | yes |
| <a name="input_external_secrets_chart"></a> [external\_secrets\_chart](#input\_external\_secrets\_chart) | n/a | `string` | `"external-secrets"` | no |
| <a name="input_external_secrets_name"></a> [external\_secrets\_name](#input\_external\_secrets\_name) | Define variables | `string` | `"external-secrets"` | no |
| <a name="input_external_secrets_repository"></a> [external\_secrets\_repository](#input\_external\_secrets\_repository) | n/a | `string` | `"https://charts.external-secrets.io"` | no |
| <a name="input_external_secrets_version"></a> [external\_secrets\_version](#input\_external\_secrets\_version) | n/a | `string` | `"0.8.0"` | no |
| <a name="input_install_crds"></a> [install\_crds](#input\_install\_crds) | n/a | `string` | `"true"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `any` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | n/a | `string` | `"arn:aws:iam::976552365380:role/karpenter-eks-node-group-20240820074628272500000001"` | no |
| <a name="input_secret_store_manifest"></a> [secret\_store\_manifest](#input\_secret\_store\_manifest) | YAML configuration for Secret Store | `string` | n/a | yes |
| <a name="input_service_account_create"></a> [service\_account\_create](#input\_service\_account\_create) | n/a | `string` | `"false"` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | n/a | `string` | `"external-secrets-sa"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace"></a> [namespace](#output\_namespace) | The namespace where External Secrets is deployed. |
| <a name="output_release_name"></a> [release\_name](#output\_release\_name) | The name of the Helm release. |
<!-- END_TF_DOCS -->
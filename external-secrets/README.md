<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_external_secret_service_account"></a> [external\_secret\_service\_account](#module\_external\_secret\_service\_account) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.30.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.external_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.external_secrets_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [helm_release.external_secrets](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The Kubernetes namespace where the external-dns will be deployed | `string` | `"kube-system"` | no |
| <a name="input_oidc_provider"></a> [oidc\_provider](#input\_oidc\_provider) | The OIDC provider ARN for the EKS cluster | `string` | `""` | no |
| <a name="input_oidc_url"></a> [oidc\_url](#input\_oidc\_url) | The OIDC provider URL for the EKS cluster | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
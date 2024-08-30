<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Default Admin Password | `string` | `""` | no |
| <a name="input_argocd_chart_version"></a> [argocd\_chart\_version](#input\_argocd\_chart\_version) | Version of ArgoCD chart to install | `string` | `"5.27.1"` | no |
| <a name="input_enable_dex"></a> [enable\_dex](#input\_enable\_dex) | Enabled the dex server? | `bool` | `true` | no |
| <a name="input_insecure"></a> [insecure](#input\_insecure) | Disable TLS on the ArogCD API Server? | `bool` | `false` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to install ArgoCD chart into | `string` | `"argocd"` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Helm release name | `string` | `"argocd"` | no |
| <a name="input_timeout_seconds"></a> [timeout\_seconds](#input\_timeout\_seconds) | Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here. | `number` | `800` | no |
| <a name="input_values_file"></a> [values\_file](#input\_values\_file) | The name of the ArgoCD helm chart values file to use | `string` | `"values.yaml"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argo_cd_server_url"></a> [argo\_cd\_server\_url](#output\_argo\_cd\_server\_url) | URL of the ArgoCD server |
<!-- END_TF_DOCS -->
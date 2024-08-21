<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.6.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.6.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_karpenter"></a> [karpenter](#module\_karpenter) | git::https://github.com/terraform-aws-modules/terraform-aws-eks//modules/karpenter | 5fe865e860c4cc8506c639f2e63bc25e21a31b37 |

## Resources

| Name | Type |
|------|------|
| [helm_release.karpenter](https://registry.terraform.io/providers/hashicorp/helm/2.6.0/docs/resources/release) | resource |
| [kubectl_manifest.karpenter_node_class](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [kubectl_manifest.karpenter_node_pool](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | The endpoint URL of the EKS cluster | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | n/a | yes |
| <a name="input_ecr_repo_password"></a> [ecr\_repo\_password](#input\_ecr\_repo\_password) | The password for the ECR repository | `string` | n/a | yes |
| <a name="input_ecr_repo_username"></a> [ecr\_repo\_username](#input\_ecr\_repo\_username) | The username for the ECR repository | `string` | n/a | yes |
| <a name="input_karpenter_namespace"></a> [karpenter\_namespace](#input\_karpenter\_namespace) | Namespace for Karpenter resources | `string` | `"kube-system"` | no |
| <a name="input_karpenter_node_pool_config"></a> [karpenter\_node\_pool\_config](#input\_karpenter\_node\_pool\_config) | YAML configuration for Karpenter Node Pool | `string` | n/a | yes |
| <a name="input_karpenter_version"></a> [karpenter\_version](#input\_karpenter\_version) | Version of the Karpenter Helm chart | `string` | `"0.37.0"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to the resources. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
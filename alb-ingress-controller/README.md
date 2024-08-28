<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.alb_ingress_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.alb_ingress_controller_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [helm_release.alb_ingress_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The Kubernetes namespace where the external-dns will be deployed | `string` | `"kube-system"` | no |
| <a name="input_oidc_provider"></a> [oidc\_provider](#input\_oidc\_provider) | The OIDC provider ARN for the EKS cluster | `string` | `""` | no |
| <a name="input_oidc_url"></a> [oidc\_url](#input\_oidc\_url) | The OIDC provider URL for the EKS cluster | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the EKS cluster is located | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID where the ALB Ingress Controller will be deployed | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
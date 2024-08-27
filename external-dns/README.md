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
| [aws_iam_role.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.external_dns_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [helm_release.external_dns](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_domain_filter"></a> [domain\_filter](#input\_domain\_filter) | The domain filter for restricting DNS management to a specific domain | `string` | n/a | yes |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | The ID of the Route 53 hosted zone | `string` | `""` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The Kubernetes namespace where the external-dns will be deployed | `string` | `"kube-system"` | no |
| <a name="input_oidc_id"></a> [oidc\_id](#input\_oidc\_id) | The OIDC provider ID for the EKS cluster | `string` | `""` | no |
| <a name="input_oidc_provider"></a> [oidc\_provider](#input\_oidc\_provider) | The OIDC provider ARN for the EKS cluster | `string` | `""` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The policy for managing DNS records (e.g., upsert-only, sync) | `string` | `"upsert-only"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where the resources are located | `string` | `"eu-central-1"` | no |
| <a name="input_registry"></a> [registry](#input\_registry) | The registry type for managing ownership (e.g., txt) | `string` | `"txt"` | no |
| <a name="input_sources"></a> [sources](#input\_sources) | The sources for DNS records (e.g., service, ingress) | `string` | `"service,ingress"` | no |
| <a name="input_txt_prefix"></a> [txt\_prefix](#input\_txt\_prefix) | The prefix used for TXT records | `string` | `"_external-dns"` | no |
| <a name="input_zone_type"></a> [zone\_type](#input\_zone\_type) | The type of Route53 zone to manage (public or private) | `string` | `"public"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
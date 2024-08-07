<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | git::https://github.com/terraform-aws-modules/terraform-aws-eks | 5fe865e860c4cc8506c639f2e63bc25e21a31b37 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | The AMI type for the managed node group | `string` | `"AL2023_x86_64_STANDARD"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The Kubernetes version for the EKS cluster | `string` | `"1.30"` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | Desired size of the managed node group | `number` | `1` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | Comma-separated list of instance types for the managed node group | `string` | `"t3.medium"` | no |
| <a name="input_intra_subnets"></a> [intra\_subnets](#input\_intra\_subnets) | List of intra subnet IDs for the EKS cluster control plane | `list(string)` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum size of the managed node group | `number` | `3` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum size of the managed node group | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the EKS cluster | `string` | `"my-eks-cluster"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet IDs for the EKS cluster | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to resources | `map(string)` | `{}` | no |
| <a name="input_taint_effect"></a> [taint\_effect](#input\_taint\_effect) | The effect of the taint applied to the managed node group | `string` | `"NO_SCHEDULE"` | no |
| <a name="input_taint_key"></a> [taint\_key](#input\_taint\_key) | The key for the taint applied to the managed node group | `string` | `"CriticalAddonsOnly"` | no |
| <a name="input_taint_value"></a> [taint\_value](#input\_taint\_value) | The value for the taint applied to the managed node group | `string` | `"true"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID where the EKS cluster will be deployed | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
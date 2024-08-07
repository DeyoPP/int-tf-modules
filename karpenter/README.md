<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_karpenter"></a> [karpenter](#module\_karpenter) | git::https://github.com/terraform-aws-modules/terraform-aws-eks//modules/karpenter | 5fe865e860c4cc8506c639f2e63bc25e21a31b37 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_event_rules"></a> [event\_rules](#output\_event\_rules) | Map of the event rules created and their attributes |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | The Amazon Resource Name (ARN) specifying the controller IAM role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | The name of the controller IAM role |
| <a name="output_iam_role_unique_id"></a> [iam\_role\_unique\_id](#output\_iam\_role\_unique\_id) | Stable and unique string identifying the controller IAM role |
| <a name="output_instance_profile_arn"></a> [instance\_profile\_arn](#output\_instance\_profile\_arn) | ARN assigned by AWS to the instance profile |
| <a name="output_instance_profile_id"></a> [instance\_profile\_id](#output\_instance\_profile\_id) | Instance profile's ID |
| <a name="output_instance_profile_name"></a> [instance\_profile\_name](#output\_instance\_profile\_name) | Name of the instance profile |
| <a name="output_instance_profile_unique"></a> [instance\_profile\_unique](#output\_instance\_profile\_unique) | Stable and unique string identifying the IAM instance profile |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | Namespace associated with the Karpenter Pod Identity |
| <a name="output_node_access_entry_arn"></a> [node\_access\_entry\_arn](#output\_node\_access\_entry\_arn) | Amazon Resource Name (ARN) of the node Access Entry |
| <a name="output_node_iam_role_arn"></a> [node\_iam\_role\_arn](#output\_node\_iam\_role\_arn) | The Amazon Resource Name (ARN) specifying the node IAM role |
| <a name="output_node_iam_role_name"></a> [node\_iam\_role\_name](#output\_node\_iam\_role\_name) | The name of the node IAM role |
| <a name="output_node_iam_role_unique_id"></a> [node\_iam\_role\_unique\_id](#output\_node\_iam\_role\_unique\_id) | Stable and unique string identifying the node IAM role |
| <a name="output_queue_arn"></a> [queue\_arn](#output\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_queue_name"></a> [queue\_name](#output\_queue\_name) | The name of the created Amazon SQS queue |
| <a name="output_queue_url"></a> [queue\_url](#output\_queue\_url) | The URL for the created Amazon SQS queue |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | Service Account associated with the Karpenter Pod Identity |
<!-- END_TF_DOCS -->
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cdn"></a> [cdn](#module\_cdn) | git::https://github.com/terraform-aws-modules/terraform-aws-cloudfront | a0f0506106a4c8815c1c32596e327763acbef2c2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_aliases"></a> [cdn\_aliases](#input\_cdn\_aliases) | Aliases for the CloudFront distribution | `list(string)` | n/a | yes |
| <a name="input_cdn_allowed_methods"></a> [cdn\_allowed\_methods](#input\_cdn\_allowed\_methods) | Allowed HTTP methods for the CloudFront distribution | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD"<br>]</pre> | no |
| <a name="input_cdn_cached_methods"></a> [cdn\_cached\_methods](#input\_cdn\_cached\_methods) | Cached HTTP methods for the CloudFront distribution | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD"<br>]</pre> | no |
| <a name="input_cdn_certificate_arn"></a> [cdn\_certificate\_arn](#input\_cdn\_certificate\_arn) | ARN of the ACM certificate for CloudFront | `string` | n/a | yes |
| <a name="input_cdn_comment"></a> [cdn\_comment](#input\_cdn\_comment) | Comment for the CloudFront distribution | `string` | `""` | no |
| <a name="input_cdn_enabled"></a> [cdn\_enabled](#input\_cdn\_enabled) | Enable or disable the CloudFront distribution | `bool` | `true` | no |
| <a name="input_cdn_is_ipv6_enabled"></a> [cdn\_is\_ipv6\_enabled](#input\_cdn\_is\_ipv6\_enabled) | Enable or disable IPv6 for the CloudFront distribution | `bool` | `true` | no |
| <a name="input_cdn_price_class"></a> [cdn\_price\_class](#input\_cdn\_price\_class) | Price class for the CloudFront distribution | `string` | `"PriceClass_100"` | no |
| <a name="input_cdn_query_string"></a> [cdn\_query\_string](#input\_cdn\_query\_string) | Enable or disable caching based on query strings | `bool` | `false` | no |
| <a name="input_cdn_s3_bucket_domain"></a> [cdn\_s3\_bucket\_domain](#input\_cdn\_s3\_bucket\_domain) | Domain name of the S3 bucket | `string` | n/a | yes |
| <a name="input_cdn_viewer_protocol_policy"></a> [cdn\_viewer\_protocol\_policy](#input\_cdn\_viewer\_protocol\_policy) | Viewer protocol policy | `string` | `"redirect-to-https"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
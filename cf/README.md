<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_aws.extra"></a> [aws.extra](#provider\_aws.extra) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.cf_www](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_route53_record.record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.www_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | n/a | `string` | n/a | yes |
| <a name="input_aliases"></a> [aliases](#input\_aliases) | CNAME for our website | `list(string)` | n/a | yes |
| <a name="input_cloudfront_default_certificate"></a> [cloudfront\_default\_certificate](#input\_cloudfront\_default\_certificate) | n/a | `bool` | n/a | yes |
| <a name="input_compress"></a> [compress](#input\_compress) | n/a | `bool` | n/a | yes |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | n/a | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_forward"></a> [forward](#input\_forward) | n/a | `string` | n/a | yes |
| <a name="input_meta"></a> [meta](#input\_meta) | n/a | <pre>object({<br>    owner    = string<br>    basename = string<br>    suffix   = string<br>  })</pre> | n/a | yes |
| <a name="input_methods"></a> [methods](#input\_methods) | n/a | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_origin_id"></a> [origin\_id](#input\_origin\_id) | n/a | `string` | n/a | yes |
| <a name="input_origin_id_www"></a> [origin\_id\_www](#input\_origin\_id\_www) | n/a | `string` | n/a | yes |
| <a name="input_query_string"></a> [query\_string](#input\_query\_string) | n/a | `bool` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_restriction_type"></a> [restriction\_type](#input\_restriction\_type) | n/a | `string` | n/a | yes |
| <a name="input_s3_endpoint"></a> [s3\_endpoint](#input\_s3\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_s3_endpoint_www"></a> [s3\_endpoint\_www](#input\_s3\_endpoint\_www) | n/a | `string` | n/a | yes |
| <a name="input_ssl_support_method"></a> [ssl\_support\_method](#input\_ssl\_support\_method) | n/a | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | n/a | `string` | n/a | yes |
| <a name="input_viewer_protocol_policy"></a> [viewer\_protocol\_policy](#input\_viewer\_protocol\_policy) | n/a | `string` | n/a | yes |
| <a name="input_web_acl_id"></a> [web\_acl\_id](#input\_web\_acl\_id) | ACL ID of WAF | `string` | n/a | yes |
| <a name="input_www_aliases"></a> [www\_aliases](#input\_www\_aliases) | CNAME for our website | `list(string)` | n/a | yes |
| <a name="input_www_name"></a> [www\_name](#input\_www\_name) | n/a | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudfront_distribution.cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_route53_record.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aliases"></a> [aliases](#input\_aliases) | A list of aliases for the CloudFront distribution. | `list(string)` | n/a | yes |
| <a name="input_compress"></a> [compress](#input\_compress) | Whether CloudFront will compress content. | `bool` | `true` | no |
| <a name="input_create_origin_access_control"></a> [create\_origin\_access\_control](#input\_create\_origin\_access\_control) | Flag to create origin access control. | `bool` | `true` | no |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | The default root object for the CloudFront distribution. | `string` | `"index.html"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for the ACM certificate. | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable the CloudFront distribution. | `bool` | `true` | no |
| <a name="input_forward"></a> [forward](#input\_forward) | Specifies how cookies are forwarded to the origin. | `string` | `"none"` | no |
| <a name="input_methods"></a> [methods](#input\_methods) | A list of HTTP methods allowed for the default cache behavior. | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD"<br>]</pre> | no |
| <a name="input_origin_id"></a> [origin\_id](#input\_origin\_id) | The ID for the CloudFront origin. | `string` | n/a | yes |
| <a name="input_query_string"></a> [query\_string](#input\_query\_string) | Whether to forward query strings to the origin. | `bool` | `false` | no |
| <a name="input_restriction_type"></a> [restriction\_type](#input\_restriction\_type) | The restriction type for geo restrictions. | `string` | `"none"` | no |
| <a name="input_s3_endpoint"></a> [s3\_endpoint](#input\_s3\_endpoint) | The endpoint of the S3 bucket. | `string` | n/a | yes |
| <a name="input_viewer_protocol_policy"></a> [viewer\_protocol\_policy](#input\_viewer\_protocol\_policy) | The protocol policy for viewers. | `string` | `"redirect-to-https"` | no |
| <a name="input_web_acl_id"></a> [web\_acl\_id](#input\_web\_acl\_id) | The ID of the Web ACL to associate with the CloudFront distribution. | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
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
| [aws_acm_certificate.api_alb_domain_cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.api_alb_cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_lb_listener.api_alb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_route53_record.api_alb_a_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.api_alb_custom_cert_validation_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_alb_arn"></a> [api\_alb\_arn](#input\_api\_alb\_arn) | The ALB ARN | `string` | n/a | yes |
| <a name="input_api_alb_dns_name"></a> [api\_alb\_dns\_name](#input\_api\_alb\_dns\_name) | The ALB DNS Name | `string` | n/a | yes |
| <a name="input_api_alb_zone_id"></a> [api\_alb\_zone\_id](#input\_api\_alb\_zone\_id) | The ALB zone id | `string` | n/a | yes |
| <a name="input_api_fargate_lb_target_group_arn"></a> [api\_fargate\_lb\_target\_group\_arn](#input\_api\_fargate\_lb\_target\_group\_arn) | The ALB target group ARN | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS Region to deploy resources | `string` | n/a | yes |
| <a name="input_domain_prefix"></a> [domain\_prefix](#input\_domain\_prefix) | The prefix for the domain | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The deployment environment | `string` | n/a | yes |
| <a name="input_parent_api_zone_id"></a> [parent\_api\_zone\_id](#input\_parent\_api\_zone\_id) | The parent domain zone id | `string` | n/a | yes |
| <a name="input_parent_domain_suffix"></a> [parent\_domain\_suffix](#input\_parent\_domain\_suffix) | The parent domain suffix for the certificate | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

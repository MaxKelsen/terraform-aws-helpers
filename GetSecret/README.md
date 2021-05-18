# Get Secret 
Just a little get secret module for use in a downstream terraform script

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
| [aws_secretsmanager_secret.get](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.get](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | A valid region where secrets manager holds the secrets. | `string` | n/a | yes |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | The specific secret name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_get_secret"></a> [get\_secret](#output\_get\_secret) | A raw dump - probably JSON string encoded of the whole secret |
| <a name="output_get_secret_jsondecode"></a> [get\_secret\_jsondecode](#output\_get\_secret\_jsondecode) | JSON decoded whole secret |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

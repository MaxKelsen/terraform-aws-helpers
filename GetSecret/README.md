# Get Secret 
Just a little get secret module for use in a downstream terraform script

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_secretsmanager_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) |
| [aws_secretsmanager_secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | A valid region where secrets manager holds the secrets. | `string` | n/a | yes |
| secret\_name | The specific secret name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| get\_secret | A raw dump - probably JSON string encoded of the whole secret |
| get\_secret\_jsondecode | JSON decoded whole secret |



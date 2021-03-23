# Secrets Manager Role 

## Secret Format

+ naming convention has to be followed to ensure secret can be located by name
 
## Secret Storage Format

The secret should be stored the following way, in the secrets manager (plaintext):

        {
            "AccessKey": "A###########",
            "SecretAccessKey": "######################"
        }

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
| aws\_region | A valid region where secretsmanager holds the secrets | `string` | n/a | yes |
| secret\_name | The specific secret name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| role\_access\_key | JSON decoded AWS Access Key |
| role\_secret\_access\_key | JSON decoded AWS Secret Access Key |

### Changes
+ refactored to be more generic
+ update README



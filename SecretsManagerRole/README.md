# Secrets Manager Role 

## Secret Format

+ naming convention has to be followed to ensure secret can be located by name
 
## Secret Storage Format

The secret should be stored the following way, in the secrets manager (plaintext):

        {
            "AccessKey": "A###########",
            "SecretAccessKey": "######################"
        }

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
| [aws_secretsmanager_secret.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | A valid region where secretsmanager holds the secrets | `string` | n/a | yes |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | The specific secret name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_access_key"></a> [role\_access\_key](#output\_role\_access\_key) | JSON decoded AWS Access Key |
| <a name="output_role_secret_access_key"></a> [role\_secret\_access\_key](#output\_role\_secret\_access\_key) | JSON decoded AWS Secret Access Key |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### Changes
+ refactored to be more generic
+ update README



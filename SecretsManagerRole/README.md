# Secrets Manager Role 

## Inputs
+ aws_region - a valid region where secrets manager holds the secrets
+ secret_name - the specific secret

## Outputs
+ role_access_key
+ role_secret_access_key

## Secret Format

+ naming convention has to be followed to ensure secret can be located by name

 
 
## Secret Storage Format

The secret should be stored the following way, in the secrets manager (plaintext):

        {
            "AccessKey": "A###########",
            "SecretAccessKey": "######################"
        }


### Changes
+ refactored to be more generic
+ update README



# Get Secret 
Just a little get secret module for use in a downstream terraform script

## Inputs
+ aws_region - a valid region where secrets manager holds the secrets
+ secret_name - the specific secret name

## Outputs
+ get_secret - just a raw dump -probably json string encoded of the whole secret
+ get_secret_jsondecode = json decoded whole secret




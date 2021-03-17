# Terraform Common Module Library

The purpose of this repository is to maximize code re-use by placing commonly used modules here.

# Contents

## Get Secret
Just go get me a secret to use in my pipeline thank you very much

## Secrets Manager Role
To make pipelines work right, terraform needs to grab credentials for execution in pipelines from a (preferrably) centralised secrets manager.

## SQS with DLQ
This module creates sqs queues with dead letter queues

# How to call these modules
Terraform will recognize unprefixed github.com URLs and interpret them automatically as Git repository sources.

These GitHub schemes are treated as convenient aliases for the general Git repository address scheme, and so they obtain credentials in the same way and support the ref argument for selecting a specific revision. 

*You will need to configure credentials in particular to access private repositories.*

### Modules in Package Sub-directories
When the source of a module is a version control repository or archive file (generically, a "package"), the module itself may be in a sub-directory relative to the root of the package.

A special double-slash syntax is interpreted by Terraform to indicate that the remaining path after that point is a sub-directory within the package. For example:

### Short Example  
  
    module "SqsWithDlq" {
      source = "github.com/MaxKelsen/mk-tf-common//SqsWithDlq?ref=v1.0.0"
    }
    
### Full Example

    module "sst-sqs-queues" {
      depends_on = [ module.SecretsManager-sqs ]
      source = "github.com/MaxKelsen/mk-tf-common/terraform-common-modules.git//SqsWithDlq?ref=v1.0.0"
      providers = {
        aws = aws.sqs
      }
      aws_region = var.aws_region
      environment = var.environment
      account_id = var.aws_account_ids[var.environment]
      sqs_queues = [
        "thumb-proc",
      ]
      enable_dlq = var.enable_dlq
    }   

# Selecting a Revision
By default, Terraform will clone and use the default branch (referenced by HEAD) in the selected repository. You can override this using the ref argument:

    module "vpc" {
      source = "github.com/MaxKelsen/mk-tf-common//SqsWithDlq?ref=v1.0.0"
    }
    
The value of the ref argument can be any reference that would be accepted by the git checkout command, including branch and tag names.

These modules will need to be backwards compatible, so the version tag is absolutely crucial.

If the source address has arguments, such as the ref argument supported for the version control sources, the sub-directory portion must be before those arguments:

    git::https://example.com/network.git//modules/vpc?ref=v1.2.0
     
# Links
https://www.terraform.io/docs/language/modules/sources.html


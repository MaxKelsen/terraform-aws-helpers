# Terraform AWS Helper Module Library

### Provision Instructions

Copy and paste into your Terraform configuration, insert the variables, and run terraform init :

    module "helpers" {
      source  = "MaxKelsen/helpers/aws"
      version = "1.4.0"
    }

The purpose of this repository is to maximize code re-use by placing commonly used aws helper modules in one registry module.

# Contents
We currently have the following sub-modules

## Get Secret
Just go get me a secret to use in my pipeline thank you very much

## Secrets Manager Role
To make pipelines work right, terraform needs to grab credentials for execution in pipelines from a (preferrably) centralised secrets manager.

## SQS with DLQ
This module creates sqs queues with dead letter queues

## Aws Certificate
Sign a real cert with dns validation for an ALB

### Modules in Package Sub-directories
When the source of a module is a version control repository or archive file (generically, a "package"), the module itself may be in a sub-directory relative to the root of the package.

A special double-slash syntax is interpreted by Terraform to indicate that the remaining path after that point is a sub-directory within the package. For example:

### Short Example  
  
    module "SqsWithDlq" {
        source  = "MaxKelsen/helpers/aws//SqsWithDlq"
        version = "1.5.2"
    }
    
### Full Example

    module "project-sqs-queues" {
      source  = "MaxKelsen/helpers/aws//SqsWithDlq"
      version = "1.5.2"
      providers = {
        aws = aws.sqs
      }
      aws_region = var.aws_region
      environment = var.environment
      sqs_queues = {
        project_queue_example = {
          fifo_queue = false
          delay_seconds = 0
          max_message_size = 262144
          message_retention_seconds = 1209600
          receive_wait_time_seconds = 0
          visibility_timeout_seconds = 30
          kms_master_key_id = "alias/aws/sqs"
          kms_data_key_reuse_period_seconds = 300
        }
      }
    }   



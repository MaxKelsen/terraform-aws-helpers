# Usage

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

# sqs_queues
Example Queue Configurations (Non-FIFO/FIFO):

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
      },
      project_queue_fifo_example = {
        fifo_queue = true
        delay_seconds = 0
        max_message_size = 4096
        message_retention_seconds = 86400
        receive_wait_time_seconds = 0
        visibility_timeout_seconds = 30
        kms_master_key_id = "alias/aws/sqs"
        kms_data_key_reuse_period_seconds = 300
      }
    }

## Intriguing Caveats    
If you have a FIFO queue you must have a FIFO Dead Letter Queue.
And therefore, if you have a standard queue, the dead letter queue must be standard (ie Non-FIFO)

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
| [aws_sqs_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | AWS Region to deploy into | `string` | n/a | yes |
| environment | Compute environment to deploy into | `string` | n/a | yes |
| sqs\_queues | Map containing specifications for queues to be deployed | <pre>map(object({<br>    fifo_queue = bool<br>    max_message_size = number<br>    delay_seconds = number<br>    message_retention_seconds = number<br>    visibility_timeout_seconds = number<br>    receive_wait_time_seconds = number<br>    visibility_timeout_seconds = number<br>    kms_master_key_id = string<br>    kms_data_key_reuse_period_seconds = number<br>  }))</pre> | n/a | yes |

## Outputs

No output.

# Handy but very long Defaults

+ delay_seconds = 0
+ max_message_size = 262144
+ message_retention_seconds = 1209600
+ receive_wait_time_seconds = 0
+ visibility_timeout_seconds = 30
+ kms_master_key_id = "alias/aws/sqs"
+ kms_data_key_reuse_period_seconds = 300

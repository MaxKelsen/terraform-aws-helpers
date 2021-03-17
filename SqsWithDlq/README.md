# Usage

    module "project-sqs-queues" {
      source  = "MaxKelsen/helpers/aws//SqsWithDlq"
      version = "1.3.0"
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

# Handy but very long Defaults

+ delay_seconds = 0
+ max_message_size = 262144
+ message_retention_seconds = 1209600
+ receive_wait_time_seconds = 0
+ visibility_timeout_seconds = 30
+ kms_master_key_id = "alias/aws/sqs"
+ kms_data_key_reuse_period_seconds = 300

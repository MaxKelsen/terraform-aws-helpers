variable "environment" {
  description = "Compute environment to deploy into"
  type        = string
}

variable "aws_region" {
  description = "AWS Region to deploy into"
  type        = string
}

variable "sqs_queues" {
  description = "Map containing specifications for queues to be deployed"
  type = map(object({
    fifo_queue                        = bool
    max_message_size                  = number
    delay_seconds                     = number
    message_retention_seconds         = number
    visibility_timeout_seconds        = number
    receive_wait_time_seconds         = number
    visibility_timeout_seconds        = number
    kms_master_key_id                 = string
    kms_data_key_reuse_period_seconds = number
  }))
}

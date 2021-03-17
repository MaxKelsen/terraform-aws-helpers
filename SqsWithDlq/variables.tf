variable "environment" {}

variable "aws_region" {}

variable "sqs_queues" {
  type = map(object({
    fifo_queue = bool
    max_message_size = number
    message_retention_seconds = number
    visibility_timeout_seconds = number
    receive_wait_time_seconds = number
    visibility_timeout_seconds = number
    kms_master_key_id = string
    kms_data_key_reuse_period_seconds = number
  }))
}
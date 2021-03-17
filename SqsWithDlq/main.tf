resource "aws_sqs_queue" "queue_deadletter" {
  count = length(var.sqs_queues)
  name = "sst-${var.sqs_queues[count.index]}-dlq-${var.aws_region}-${var.environment}"
  fifo_queue                  = false
  delay_seconds = 0
  max_message_size = 262144
  message_retention_seconds = 1209600
  policy = ""
  receive_wait_time_seconds = 0
  visibility_timeout_seconds = 30
  kms_master_key_id = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
  tags = {
    environment = var.environment
    deployment = "pipeline"
    dlq = true
  }
}

resource "aws_sqs_queue" "queue" {
  depends_on = [ aws_sqs_queue.queue_deadletter ]
  count = length(var.sqs_queues)
  name = "sst-${var.sqs_queues[count.index]}-${var.aws_region}-${var.environment}"
  fifo_queue                  = false
  delay_seconds = 0
  max_message_size = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  redrive_policy = "{\"deadLetterTargetArn\":\"${element(concat(aws_sqs_queue.queue_deadletter.*.arn, list("")), count.index)}\",\"maxReceiveCount\":5}"
  kms_master_key_id = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
  tags = {
    environment = var.environment
    deployment = "pipeline"
    fanout = true
  }
}

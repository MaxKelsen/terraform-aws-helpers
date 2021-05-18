resource "aws_sqs_queue" "queue_deadletter" {
  for_each                          = var.sqs_queues
  name                              = format("%s-dlq-%s-%s", each.key, var.aws_region, var.environment)
  fifo_queue                        = each.value["fifo_queue"]
  delay_seconds                     = each.value["delay_seconds"]
  max_message_size                  = each.value["max_message_size"]
  message_retention_seconds         = each.value["max_message_size"]
  policy                            = ""
  receive_wait_time_seconds         = each.value["receive_wait_time_seconds"]
  visibility_timeout_seconds        = each.value["visibility_timeout_seconds"]
  kms_master_key_id                 = each.value["kms_master_key_id"]
  kms_data_key_reuse_period_seconds = each.value["kms_data_key_reuse_period_seconds"]
  tags = {
    environment = var.environment
    deployment  = "terraform"
  }
}

resource "aws_sqs_queue" "queue" {
  depends_on                = [aws_sqs_queue.queue_deadletter]
  for_each                  = var.sqs_queues
  name                      = format("%s-%s-%s", each.key, var.aws_region, var.environment)
  fifo_queue                = each.value["fifo_queue"]
  delay_seconds             = each.value["delay_seconds"]
  max_message_size          = each.value["max_message_size"]
  message_retention_seconds = each.value["max_message_size"]
  receive_wait_time_seconds = each.value["receive_wait_time_seconds"]
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.queue_deadletter[each.key].arn
    maxReceiveCount     = 5
  })
  kms_master_key_id                 = each.value["kms_master_key_id"]
  kms_data_key_reuse_period_seconds = each.value["kms_data_key_reuse_period_seconds"]
  tags = {
    environment = var.environment
    deployment  = "terraform"
  }
}

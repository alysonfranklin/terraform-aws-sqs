output "sqs_queue_id" {
  description = "O URL para a fila Amazon SQS criada"
  value = element(
    concat(
      aws_sqs_queue.this.*.id,
      [""],
    ),
    0,
  )
}

output "sqs_queue_arn" {
  description = "O ARN da fila SQS"
  value = element(
    concat(
      aws_sqs_queue.this.*.arn,
      [""],
    ),
    0,
  )
}

output "sqs_queue_name" {
  description = "O nome da fila SQS"
  value = element(
    concat(
      data.aws_arn.this.*.resource,
      [""],
    ),
    0,
  )
}
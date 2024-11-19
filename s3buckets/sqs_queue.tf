
#we create the sqs queue
resource "aws_sqs_queue" "example_queue" {
  name = "source-bucket-event-queue" 

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "s3.amazonaws.com"
        },
        Action = "sqs:SendMessage",
        Resource = "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:source-bucket-event-queue"
      },
      {
        Effect = "Allow",
        Principal = "*", # Allows anyone to send messages
        Action = "sqs:SendMessage",
        Resource = "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:source-bucket-event-queue"
      }
    ]
  })
}

# we let the s3 bucket input info in the sqs queue
resource "aws_s3_bucket_notification" "source_bucket_notification" {
  bucket = aws_s3_bucket.source_bucket.id 

  queue {
    queue_arn     = aws_sqs_queue.example_queue.arn
    events        = ["s3:ObjectCreated:*"] 
  }
}

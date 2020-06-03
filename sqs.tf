resource "aws_sqs_queue" "sqs_queue" {
  name = "siem_onprem_sqs_queue"
  fifo_queue = "false"
  visibility_timeout_seconds = "60"
  message_retention_seconds = "1209600"
  kms_master_key_id = "${aws_kms_key.test.arn}"
}

# Setup SQS Queue Policy
resource "aws_sqs_queue_policy" "sqs_queue_policy" {
  queue_url = "${aws_sqs_queue.sqs_queue.id}"
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Id": "SQSDefaultPolicy",
    "Statement":
    [
      {
        "Sid": "Main",
        "Effect": "Allow",
        "Principal":
        {
          "AWS": "*"
        },
        "Action": "SQS:SendMessage",
        "Resource": "${aws_sqs_queue.sqs_queue.arn}",
        "Condition":
        {
          "ArnLike":
          {
            "aws:SourceArn": "${aws_s3_bucket.silvano-test-bucket.arn}"
          }
        }
      }
    ]
  }
POLICY
}
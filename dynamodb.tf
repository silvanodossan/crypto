resource "aws_dynamodb_table" "example" {
  name                       = "example"
  hash_key                   = "LockID"
  write_capacity             = "1"
  read_capacity              = "1"
  server_side_encryption     {
      enabled       = "true"               
      kms_key_arn   = "${aws_kms_key.test.arn}"
  }

  attribute {
    name = "LockID"
    type = "S"
  }

}
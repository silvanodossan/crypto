resource "aws_s3_bucket" "silvano-test-bucket" {
  bucket = "silvano-test-bucket"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.test.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }  

}
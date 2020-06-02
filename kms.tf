resource "aws_kms_key" "test" {
  description             = "test"
  policy = "${data.template_file.test.rendered}"
}

resource "aws_kms_alias" "test" {
  name          = "alias/test"
  target_key_id = "${aws_kms_key.test.key_id}"
}

data "template_file" "test" {
  template = "${file("${path.module}/kms_policy.json.tpl")}"
}




resource "aws_instance" "test" {
  ami           = "ami-0330ffc12d7224386" # us-west-2
  instance_type = "t2.micro"
  key_name = "awsapril2020"
  iam_instance_profile  = "test"

  root_block_device {
    volume_type = "gp2"
    volume_size = "10"
    delete_on_termination = "true"
    encrypted = "true"
    # kms_key_id = "${aws_kms_key.test.key_id}" 
    # Modifying any of the root_block_device settings other than volume_size requires resource replacement.
    # So if using KMS-CMK for the root volume the instance will be rebuilt with every terraform apply
  }

  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_type = "gp2"
    volume_size = "10"
    delete_on_termination = "true"
    encrypted = "true"
    kms_key_id = "a4755636-8326-4071-941c-8914fc7a839d"
  }

}
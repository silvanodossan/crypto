{
    "Version": "2012-10-17",
    "Id": "key-policy",
    "Statement": [
        {
            "Sid": "Allow IBM use of the key",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::708544770472:role/test"
            },
            "Action": [
                "kms:Decrypt",
                "kms:GenerateDataKey*",
                "kms:DescribeKey"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Allow EC2 Instance role use of the key",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::708544770472:role/test"
            },
            "Action": [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:DescribeKey"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::708544770472:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
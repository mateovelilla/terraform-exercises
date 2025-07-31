provider "aws" {
    region = "us-east-2"
}

data "aws_s3_bucket" "bucket" {
    bucket = "kevholditch-already-exists"
}

resource "aws_iam_policy" "my_bucket_policy" {
    name = "my-bucket-policy"

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:ListBucket"
            ],
            "Effect": "Allow",
            "Resource": [
                "${data.aws_s3_bucket.bucket.arn}"
            ]
        }
    ]
}
EOF
}
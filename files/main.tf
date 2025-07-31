provider "aws" {
    region = "us-east-2"
}
resource "aws_iam_policy" "my_bucket_policy" {
    name = "list-buckets-policy"
    policy = file("./policy.iam")
}
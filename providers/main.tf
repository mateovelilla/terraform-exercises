

provider "aws" {
    region = "us-east-1"
}

provider "aws" {
    region = "us-east-2"
    alias = "ohio"
}

resource "aws_vpc" "n_virginia_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "ohio_vpc" {
    cidr_block = "10.1.0.0/16"
    provider = aws.ohio
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet_1" {
  cidr_block = var.subnet_1_cidr
  vpc_id     = aws_vpc.vpc.id
}

resource "aws_subnet" "subnet_2" {
  cidr_block = var.subnet_2_cidr
  vpc_id     = aws_vpc.vpc.id
}
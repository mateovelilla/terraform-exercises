##
## Problem: Make a Terraform project that creates a VPC and sets the tag Name to your name. Create another Terraform project that looks up that VPC using a data block filtering on the Nametag and outputs the CIDR range of the VPC to the terminal.
######### COMMANDS #######
# terraform init
# terraform apply
######### COMMANDS #######

provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Kevin"
  }
}

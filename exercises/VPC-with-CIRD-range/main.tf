##
## Problem: Write a Terraform project that creates a VPC with a CIDR range set from a variable in a region set by another variable. Then apply the project and set the CIDR variable using a file and the region using an environment variable.
######### COMMANDS #######
# terraform init 
# env TF_VAR_region=us-east-2 
# terraform apply
######### COMMANDS #######

provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr
}
##
## Problem: Make a Terraform project that creates a VPC and sets the tag Name to your name. Create another Terraform project that looks up that VPC using a data block filtering on the Nametag and outputs the CIDR range of the VPC to the terminal.
######### COMMANDS #######
# terraform init
# terraform apply
######### COMMANDS #######
######## EXPLANATION #####
# Subfolder part1 creates the VPC with the Name tag set to Kevin. Subfolder part2 shows how to look this up by data block and output it.
# In the folder part1, we set up an AWS provider pointing to the region "us-east-1". We then declare a "aws_vpc" resource and set the cidr_block. We also set the Name tag to our name, which is "Kevin" in this case. We then run terraform init to initialise Terraform and terraform apply to create the infrastructure.
# Then, for part2, we configure the provider and use the same region as part1 (us-east-1). We then configure the aws_vpc using a "data" block to look up the existing VPC that we created in part1. We set the Name tag to "Kevin" so that the data resource finds the VPC that we created in part1. To complete the exercise, we output the CIDR block of the VPC using an output.
#########################
provider "aws" {
  region = "us-east-2"
}

data "aws_vpc" "vpc" {

  tags = {
    Name = "Kevin"
  }
}

output "vpc_cidr" {
  value = data.aws_vpc.vpc.cidr_block
}

##
## Problem: Write a Terraform module that creates a VPC and two subnets. The module takes inputs for the CIDR ranges for the VPC and subnets and should return the created VPC and each subnet as an output. Create a Terraform project that uses the module and print the output of the module to the console.
######### COMMANDS #######
# terraform init  
# terraform apply
######### COMMANDS #######
######## EXPLANATION #####
# For the solution to this problem, we create a module by creating a folder, as shown in the example answer we have called the folder vpc. Any sub folder will be considered a module by Terraform. For the module, we have declared 3 variables (vpc_cidr, subnet_1_cidr, subnet_2_cidr) in a file called variables.tf to allow the caller to set the CIDR block of the VPC and the CIDR blocks of the 2 subnets.
# Inside the main.tf, which is present inside the vpc folder, we define the aws_vpc resource that will create the VPC. The two subnet blocks are defined using an "aws_subnet" resource. Note that we are setting the vpc_id property on each subnet to aws_vpc.vpc.id. This is important for 2 reasons.
# Firstly, it makes sure that the subnet is inside the created VPC. Without setting this, Terraform would create the subnet in the default VPC.
# Secondly, it allows Terraform to build a dependency hierarchy.
# Terraform now knows that it must create the VPC before the two subnets. The last file in our vpc module is output.tf. In this file, we are outputting each resource in its entirety.
# In the top level directory, we configure the AWS provider with a region. We then instantiate an instance of the VPC module by using a module block and by setting the source to the vpc folder, which supplies values for each of the variables. Lastly, we are outputting all of the outputs from the vpc module back to the caller using an output block and setting its value to "module.vpc".
provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "./vpc"
  vpc_cidr = "10.0.0.0/16"
  subnet_1_cidr = "10.0.0.0/24"
  subnet_2_cidr = "10.0.1.0/24"
}

output "vpc" {
  value = module.vpc
}


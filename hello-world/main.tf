######## COMMANDS ###############
# $ terraform apply             # 
#################################


provider "aws" {
    region = "us-east-2"
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "my_security_group" {
    vpc_id = aws_vpc.my_vpc.id
    name = "Example security group"
}

resource "aws_security_group_rule" "tls_in" {
    protocol = "tcp"
    security_group_id = aws_security_group.my_security_group.id
    from_port = 443
    to_port = 443
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
}

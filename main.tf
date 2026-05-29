# provider plugin details
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
# provider credentials
provider "aws" {
  region     = "us-east-2"
access_key="abcdefg"
secret_key="zyxwvutsrq"
}
resource "aws_security_group" "instance_sg-2" {
  name        = "instance-sg-2"
  description = "Allow SSH and app traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App traffic"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# resource ec2 instances get created
# 2 resources are created
resource "aws_instance" "example" {
  ami                         = "ami-091138d0f0d41ff90"
  instance_type               = "t2.micro"
  key_name                    = "key2905"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.instance_sg-2.id]
  count= 2
  tags = {
    Name = "slaves"
  }
}

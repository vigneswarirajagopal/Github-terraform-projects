terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "test" {
    ami = "ami-02b8269d5e85954ef"
    instance_type = "t3.micro"

    vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

    tags = {
        Name = "sample"
    }
  
}



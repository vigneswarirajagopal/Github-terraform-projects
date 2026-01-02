terraform {
  required_version = ">=0.13.0"
  required_providers {
    aws ={
        version = ">=2.7.0"
        source ="hashicorp/aws"
    }
}
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "tf-ecs-fargate-state-bucket" {
  bucket = "tf-ecs-fargate-state-bucket"
}



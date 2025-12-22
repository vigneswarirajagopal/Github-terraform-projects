
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}


resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "terra-vignesh-demo-state-bucket"
}

resource "aws_dynamodb_table" "my_dynamo_table" {
  name         = "terra-vigneh-demo-state-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name  = "LockID"
    type = "S"
  }
}

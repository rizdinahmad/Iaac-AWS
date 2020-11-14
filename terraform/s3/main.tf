terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.13.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

##################################################

resource "aws_s3_bucket" "bigproject" {
  bucket = "clusters.bigproject.rizdin.online"
}

resource "aws_s3_bucket_public_access_block" "bigproject" {
  bucket = aws_s3_bucket.bigproject.id

  block_public_acls   = false
  block_public_policy = false
  
}

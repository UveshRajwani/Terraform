terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.62.0"
    }
  }
}


provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "Demo-Bucket" {
  bucket = "bucketbyterraformbyuvesh"
}
resource "aws_s3_object" "File-To-Upload" {
    bucket = aws_s3_bucket.Demo-Bucket.bucket
    source = "./myfile.txt"
    key = "myfile.txt"
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.62.0"
    }
    random={
        source = "hashicorp/random"
        version = "3.6.2"
    }
  }
}


provider "aws" {
  region = "ap-south-1"
}
provider "random" {
  
}
resource "random_id" "Random-Bucket-Name" {
byte_length = 8
  
}
resource "aws_s3_bucket" "Demo-Bucket" {
  bucket = "bucketbyterraformbyuvesh-${random_id.Random-Bucket-Name.hex}"
}
resource "aws_s3_object" "File-To-Upload" {
    bucket = aws_s3_bucket.Demo-Bucket.bucket
    source = "./myfile.txt"
    key = "myfile.txt"
}
output "name" {
  value = random_id.Random-Bucket-Name.hex
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.62.0"
    }
  }
}

variable "region" {
  default = "ap-south-1"
  type = string   
  description = "This is where AWS resources will be created in"
}
provider "aws" {
  region = var.region
}

resource "aws_instance" "ec2" {
  ami = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  tags = {
    "Made By" = "Terrform"
    "Name" = "By Terrform"
  }
}
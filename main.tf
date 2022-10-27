terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "myec2" {
  ami = var.ami
  instance_type = var.instance_type
}
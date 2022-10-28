terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}



resource "aws_security_group" "dynamic_sg" {
  name = "dynamic_sg"
  description = "ingress and egress for ec2"
  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "test_keypair" {
    key_name = "test_keypair"
    public_key = file("FILE LOCATION")
}

resource "aws_instance" "myec2" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.dynamic_sg.name]
  key_name = aws_key_pair.test_keypair.key_name
}

output "ec2_global_ips" {
  value = "${aws_instance.myec2.*.public_ip}"
}


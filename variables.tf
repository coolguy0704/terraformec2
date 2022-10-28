variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-09d3b3274b6c5d4aa"
}

variable "sg_ports" {
  type = list(number)
  description = "sg ingress ports"
  default = [ 80,22 ]
}



provider "aws" {
    region = var.region
}

resource "aws_instance" "workspace_instance" {
  ami = var.ami

  instance_type = var.instnace_type
  tags = {
    Environment = "${terraform.workspace}-environment"
}
}

variable "region" {}
variable "instnace_type" {}
variable "ami" {}
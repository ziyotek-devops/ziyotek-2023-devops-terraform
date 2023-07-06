resource "aws_vpc" "ziyo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Test-Odil VPC"
  }
}
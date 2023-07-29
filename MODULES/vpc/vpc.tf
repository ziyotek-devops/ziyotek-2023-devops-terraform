resource "aws_vpc" "ziyo_vpc" {
  cidr_block = var.vpc_cidr
  tags              = {
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "ziyo_igw" {
  vpc_id = aws_vpc.ziyo_vpc.id
}
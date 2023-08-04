
resource "aws_subnet" "public_subnet" {
  count = length(var.subnets)
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.subnets[count.index]
  availability_zone = "us-east-1a"
}


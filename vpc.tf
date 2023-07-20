resource "aws_vpc" "ziyo_vpc" {
  cidr_block = var.vpc_cidr

  tags = var.general_tag

}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.subnet_1_cidr_pub
  availability_zone = "us-east-1a"
  tags              = var.general_tag
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.subnet_2_cidr_pub
  availability_zone = "us-east-1b"

  tags = var.general_tag
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.subnet_1_cidr_pri
  availability_zone = "us-east-1a"
  tags              = var.general_tag
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.subnet_2_cidr_pri
  availability_zone = "us-east-1b"
  tags              = var.general_tag
}

resource "aws_internet_gateway" "ziyo_igw" {
  vpc_id = aws_vpc.ziyo_vpc.id

  tags = var.general_tag
}

resource "aws_route_table" "ziyo_route_table" {
  vpc_id = aws_vpc.ziyo_vpc.id

  route {
    cidr_block = var.route_cider
    gateway_id = aws_internet_gateway.ziyo_igw.id
  }

  tags = var.general_tag
}

resource "aws_route_table" "ziyo_route_table_2" {
  vpc_id = aws_vpc.ziyo_vpc.id

  route {
    cidr_block = var.route_cider
    gateway_id = aws_internet_gateway.ziyo_igw.id
  }

  tags = var.general_tag

}

resource "aws_route_table_association" "ziyo_route_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.ziyo_route_table.id
}

resource "aws_route_table_association" "ziyo_route_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.ziyo_route_table_2.id
}
 
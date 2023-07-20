resource "aws_vpc" "ziyo_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = var.vpc_tags
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.subnet_2_cidr_block
  availability_zone = var.subnet_2_availability_zone

  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.private_subnet_1_cidr_block
  availability_zone = var.private_subnet_1_availability_zone
  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.private_subnet_2_cidr_block
  availability_zone = var.private_subnet_2_availability_zone
  tags = {
    Name = "private_subnet_2"
  }
}

resource "aws_internet_gateway" "ziyo_igw" {
  vpc_id = aws_vpc.ziyo_vpc.id

  tags = var.igw_tags 
}

resource "aws_route_table" "ziyo_route_table" {
  vpc_id = aws_vpc.ziyo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ziyo_igw.id
  }

  tags = var.route_table_tags
}

resource "aws_route_table" "ziyo_route_table_2" {
  vpc_id = aws_vpc.ziyo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ziyo_igw.id
  }

  tags = var.route_table_2_tags
}

resource "aws_route_table_association" "ziyo_route_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.ziyo_route_table.id
}

resource "aws_route_table_association" "ziyo_route_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.ziyo_route_table_2.id
}
 
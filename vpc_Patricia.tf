resource "aws_vpc" "ziyo_vpc" {
  cidr_block = var.cidr_block_value

  tags = {
    Name = var.tags_name_vpc
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.cidr_block_public_subnet_1
  availability_zone = var.availability_zone_public_subnet_1
  tags = {
    Name = var.tags_name_public_subnet_1
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.cidr_block_public_subnet_2
  availability_zone = var.availability_zone_public_subnet_2

  tags = {
    Name = var.tags_name_public_subnet_2
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.cidr_block_private_subnet_1
  availability_zone = var.availability_zone_private_subnet_1
  tags = {
    Name = var.tags_name_private_subnet_1
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.ziyo_vpc.id
  cidr_block        = var.cidr_block_private_subnet_2
  availability_zone = var.availability_zone_private_subnet_2
  tags = {
    Name = var.tags_name_private_subnet_1
  }
}

resource "aws_internet_gateway" "ziyo_igw" {
  vpc_id = aws_vpc.ziyo_vpc.id

  tags = {
    Name = var.tags_name_ziyo_igw
  }
}

resource "aws_route_table" "ziyo_route_table" {
  vpc_id = aws_vpc.ziyo_vpc.id

  route {
    cidr_block = var.cidr_block_ziyo_route_table
    gateway_id = aws_internet_gateway.ziyo_igw.id
  }

  tags = {
    Name = var.tags_name_ziyo_route_table
  }
}

resource "aws_route_table" "ziyo_route_table_2" {
  vpc_id = aws_vpc.ziyo_vpc.id

  route {
    cidr_block = var.cidr_block_ziyo_route_table_2
    gateway_id = aws_internet_gateway.ziyo_igw.id
  }

  tags = {
    Name = var.tags_name_ziyo_route_table_2
  }
}

resource "aws_route_table_association" "ziyo_route_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.ziyo_route_table.id
}

resource "aws_route_table_association" "ziyo_route_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.ziyo_route_table_2.id
}
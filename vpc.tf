resource "aws_vpc" "ziyo_vpc" {
  cidr_block = var.cidr_block.0

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block.1
  availability_zone = var.availability_zone.0
  tags = {
    Name = var.subnet_name.0
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block.2
  availability_zone = var.availability_zone.1

  tags = {
    Name = var.subnet_name.1
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block.3
  availability_zone = var.availability_zone.0
  tags = {
    Name = var.subnet_name.2
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block.4
  availability_zone = var.availability_zone.1
  tags = {
    Name = var.subnet_name.3
  }
}

resource "aws_internet_gateway" "ziyo_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.gw_name
  }
}

resource "aws_route_table" "ziyo_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.cidr_block.5
    gateway_id = var.gw_id
  }

  tags = {
    Name = var.zrt_name.0
  }
}

resource "aws_route_table" "ziyo_route_table_2" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr_block.5
    gateway_id = var.gw_id
  }

  tags = {
    Name = var.zrt_name.1
  }
}

resource "aws_route_table_association" "ziyo_route_assoc" {
  subnet_id      = var.subnet_id.0
  route_table_id = var.rt_id.0
}

resource "aws_route_table_association" "ziyo_route_assoc_2" {
  subnet_id      = var.subnet_id.1
  route_table_id = var.rt_id.1
}
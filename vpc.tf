provider "aws" {
  region = var.aws_region
}


resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags       = var.public_subnet_1_tags
}


resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = var.public_subnet_1_az
  tags       = var.public_subnet_1_tags
}


resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = var.public_subnet_2_az
  tags       = var.public_subnet_2_tags
}


resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = var.private_subnet_1_az
  tags       = var.private_subnet_1_tags
}


resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = var.private_subnet_2_az
  tags       = var.private_subnet_2_tags
}


resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = var.internet_gateway_tags
}


resource "aws_route_table" "public_subnet_1_route_table" {
  vpc_id = aws_vpc.main.id
  tags   = var.route_table_tags
}


resource "aws_route_table" "public_subnet_2_route_table" {
  vpc_id = aws_vpc.main.id
  tags   = var.route_table_2_tags
}


resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_subnet_1_route_table.id
}


resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_subnet_2_route_table.id
}


resource "aws_security_group" "instance_sg" {
  name_prefix = "instance_sg_"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow SSH inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP inbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "example_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  user_data     = file(var.userdata_file_path)

  tags = {
    Name = "ExampleInstance"
  }
}


resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  force_destroy = var.force_destroy

  object_lock_configuration {
    object_lock_enabled = var.object_lock_enabled
  }
}

output "instance_public_ip" {
  value = aws_instance.example_instance.public_ip
}
 

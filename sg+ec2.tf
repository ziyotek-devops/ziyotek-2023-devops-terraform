resource "aws_security_group" "nicholas_ziyo_sg" {
  name        = "nicholas-sg"
  description = "allow inbound traffic"
  vpc_id      = aws_vpc.nicholas_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nicholas_ziytotek_instance" {
  ami           = "ami-06b09bfacae1453cb"
  instance_type = "t3.micro"

  monitoring                  = true
  ebs_optimized               = true
  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.nicholas_ziyo_sg.id]
  associate_public_ip_address = true
  tags = {
    Name        = "Nicholas-ec2"
    Environment = "Prod"
  }

}




resource "aws_vpc" "nicholas_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Nicholas-VPC"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.nicholas_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.nicholas_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.nicholas_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_internet_gateway" "nicholas_igw" {
  vpc_id = aws_vpc.nicholas_vpc.id

  tags = {
    Name = "ziyo_internet_gateway"
  }
}

resource "aws_route_table" "nicholas_route_table" {
  vpc_id = aws_vpc.nicholas_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nicholas_igw.id
  }

  tags = {
    Name = "ziyo_route_table"
  }
}

resource "aws_route_table_association" "nicholas_route_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.nicholas_route_table.id
}
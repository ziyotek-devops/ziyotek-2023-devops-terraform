resource "aws_instance" "my_ziyo23_ec2_boris" {
  ami           = "ami-06b09bfacae1453cb"
  instance_type = "t3.micro"
  monitoring    = true
  tags = {
    Name        = "MyZiyo-instance"
    Environment = "test"
    Project     = "my-project"
  }
  ebs_optimized     = true
  subnet_id         = aws_subnet.ziyo_public_subnet_1.id
  availability_zone = "us-east-1a"
}

resource "aws_security_group" "my_ziyo" {
  name        = "my_ziyo-security-group"
  description = "Allow ingress traffic on port 443"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_vpc" "ziyo23_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "ziyo2023_vpc"
  }
}


resource "aws_subnet" "ziyo_public_subnet_1" {
  vpc_id            = aws_vpc.ziyo23_vpc.id
  cidr_block        = "10.10.5.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "ziyo_public_subnet_1"
  }
}
resource "aws_subnet" "ziyo_private_subnet_1" {
  vpc_id            = aws_vpc.ziyo23_vpc.id
  cidr_block        = "10.10.4.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "ziyo_private_subnet_1"
  }
}
resource "aws_subnet" "ziyo_public_subnet_3" {
  vpc_id            = aws_vpc.ziyo23_vpc.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "ziyo_public_subnet_3"
  }
}
resource "aws_internet_gateway" "ziyo_igw" {
  vpc_id = aws_vpc.ziyo23_vpc.id
  tags = {
    Name = "ziyo23_internet_gateway"
  }
}
resource "aws_route_table" "ziyo_route_table" {
  vpc_id = aws_vpc.ziyo23_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ziyo_igw.id
  }
  tags = {
    Name = "ziyo23_route_table"
  }
}

resource "aws_route_table_association" "ziyo23_route_table_association" {
  subnet_id      = aws_subnet.ziyo_public_subnet_3.id
  route_table_id = aws_route_table.ziyo_route_table.id
}

resource "aws_nat_gateway" "ziyo_private_nat_gw" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.ziyo_private_subnet_1.id
}

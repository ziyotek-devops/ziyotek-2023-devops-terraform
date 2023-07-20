variable "cidr_block" {
  default = ["10.10.0.0/16", "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "0.0.0.0/0"]
  type    = list(any)
}

variable "vpc_name" {
  default = "Ziyo_2023_VPC"
}

variable "vpc_id" {
  default = "aws_vpc.ziyo_vpc.id"
}

variable "availability_zone" {
  default = ["us-east-1a", "us-east-1b", ]
  type    = list(any)
}

variable "subnet_name" {
  default = ["public_subnet_1", "public_subnet_2", "private_subnet_1", "private_subnet_2"]
  type    = list(any)
}

variable "subnet_id" {
  default = ["aws_subnet.public_subnet_1.id", "aws_subnet.public_subnet_2.id", "private_subnet_1", "private_subnet_2"]
  type    = list(any)
}

variable "gw_name" {
  default = "ziyo_internet_gateway"
}

variable "gw_id" {
  default = "aws_internet_gateway.ziyo_igw.id"
}

variable "zrt_name" {
  default = ["ziyo_route_table", "ziyo_route_table_2"]
  type    = list(any)
}

variable "rt_id" {
  default = ["aws_route_table.ziyo_route_table.id", "aws_route_table.ziyo_route_table_2.id"]
  type    = list(any)
}
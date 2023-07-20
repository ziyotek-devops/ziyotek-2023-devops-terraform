

variable "vpc_cidr_block" {
  type    = string
  default = "10.10.0.0/16"
}

variable "vpc_tags" {
  type = map(string)
  default = {
    Name = "Ziyo_2023_VPC"
  }
}

variable "public_subnet_1_cidr" {
  type    = string
  default = "10.10.1.0/24"
}


variable "public_subnet_1_tags" {
  type = map(string)
  default = {
    Name = "public_subnet_1"
  }
}

variable "public_subnet_1_az" {
  type    = string
  default = "us-east-1a"
}

variable "public_subnet_2_cidr" {
  type    = string
  default = "10.10.2.0/24"
}

variable "public_subnet_2_tags" {
  type = map(string)
  default = {
    Name = "public_subnet_2"
  }
}

variable "public_subnet_2_az" {
  type    = string
  default = "us-east-1b"
}

variable "private_subnet_1_cidr" {
  type    = string
  default = "10.10.3.0/24"
}

variable "private_subnet_1_az" {
  type    = string
  default = "us-east-1a"
}

variable "private_subnet_2_cidr" {
  type    = string
  default = "10.10.4.0/24"
}

variable "private_subnet_2_tags" {
  type = map(string)
  default = {
    Name = "private_subnet_2"
  }
}

variable "private_subnet_2_az" {
  type    = string
  default = "us-east-1b"
}

variable "internet_gateway_name" {
  type    = string
  default = "ziyo_internet_gateway"
}

variable "internet_gateway_tags" {
  type = map(string)
  default = {
    Name = "ziyo_internet_gateway"
  }
}

variable "route_table_name" {
  type    = string
  default = "ziyo_route_table"
}

variable "route_table_tags" {
  type = map(string)
  default = {
    Name = "ziyo_route_table"
  }
}

variable "route_table_2_name" {
  type    = string
  default = "ziyo_route_table_2"
}

variable "route_table_2_tags" {
  type = map(string)
  default = {
    Name = "ziyo_route_table_2"
  }
}
variable "cidr_block_value" {
    type = string
  default = "10.10.0.0/16"
}

variable "tags_name_vpc" {
    type = string
  default = "Ziyo_2023_VPC"
}

variable "cidr_block_public_subnet_1" {
    type = string
  default =  "10.10.1.0/24"
}

variable "availability_zone_public_subnet_1" {
    type = string
  default =  "us-east-1a"
}

variable "tags_name_public_subnet_1" {
    type = string
  default = "public_subnet_1"
}

variable "cidr_block_public_subnet_2" {
    type = string
  default =  "10.10.2.0/24"
}

variable "availability_zone_public_subnet_2" {
    type = string
  default =  "us-east-1b"
}

variable "tags_name_public_subnet_2" {
    type = string
  default = "public_subnet_2"
}


variable "cidr_block_private_subnet_1" {
    type = string
  default =  "10.10.3.0/24"
}

variable "availability_zone_private_subnet_1" {
    type = string
  default =  "us-east-1a"
}

variable "tags_name_private_subnet_1" {
    type = string
  default = "private_subnet_1"
}

variable "cidr_block_private_subnet_2" {
    type = string
  default =  "10.10.4.0/24"
}

variable "availability_zone_private_subnet_2" {
    type = string
  default =  "us-east-1b"
}

variable "tags_name_private_subnet_2" {
    type = string
  default = "private_subnet_2"
}

variable "tags_name_ziyo_igw" {
    type = string
  default = "ziyo_internet_gateway"
}

variable "cidr_block_ziyo_route_table" {
    type = string
  default =  "0.0.0.0/0"
}

variable "tags_name_ziyo_route_table" {
    type = string
  default = "ziyo_route_table"
}

variable "cidr_block_ziyo_route_table_2" {
    type = string
  default =  "0.0.0.0/0"
}

variable "tags_name_ziyo_route_table_2" {
    type = string
  default = "ziyo_route_table_2"
}
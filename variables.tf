variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_ami" {
  type    = string
  default = "ami-06b09bfacae1453cb"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "radostinpaskalev_key"
}

variable "userdata_file_path" {
  type    = string
  default = "userdata.sh"
}

variable "bucket_name" {
  type    = string
  default = "ziyotek-2023-bucket-rady"
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "object_lock_enabled" {
  type    = bool
  default = true
}

variable "bucket_tags" {
  type = map(string)
  default = {
    Name        = "Nicholas"
    Environment = "Prod"
  }
}

variable "security_group_name" {
  type    = string
  default = "allow_https"
}

variable "security_group_description" {
  type    = string
  default = "Allow HTTPS inbound traffic"
}

variable "security_group_tags" {
  type = map(string)
  default = {
    Name = "allow_tls"
  }
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.10.0.0/16"
}

variable "public_subnet_1_cidr" {
  type    = string
  default = "10.10.1.0/24"
}

variable "public_subnet_1_az" {
  type    = string
  default = "us-east-1a"
}

variable "public_subnet_2_cidr" {
  type    = string
  default = "10.10.2.0/24"
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

variable "private_subnet_2_az" {
  type    = string
  default = "us-east-1b"
}

variable "internet_gateway_name" {
  type    = string
  default = "ziyo_internet_gateway"
}

variable "route_table_name" {
  type    = string
  default = "ziyo_route_table"
}

variable "route_table_2_name" {
  type    = string
  default = "ziyo_route_table_2"
}
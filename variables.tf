variable "ec2_key" {
  type        = string
  description = "an ec2 instance key for ssh"
  default     = "test2"
}

variable "s3_bucket_name" {
  type    = string
  default = "ziyotek-2023-bucket-rady-class"
}

variable "cidr_ips" {
  type    = list(any)
  default = ["0.0.0.0/0", "10.10.123.12/32"]
}

variable "bucket_tags" {
  type = map(any)
  default = {
    Name        = "Nicholas"
    Environment = "Prod"
  }
}

variable "general_tag" {
  type = map(any)
  default = {
    company = "ziyotek_2023_spring"
  }
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "subnet_1_cidr_pub" {
  type    = string
  default = "10.10.1.0/24"
}

variable "subnet_2_cidr_pub" {
  type    = string
  default = "10.10.2.0/24"
}

variable "subnet_1_cidr_pri" {
  type    = string
  default = "10.10.3.0/24"
}

variable "subnet_2_cidr_pri" {
  type    = string
  default = "10.10.4.0/24"
}

variable "route_cider" {
  type    = string
  default = "0.0.0.0/0"
}

variable "admin_user" {
  default = "admin_user"
}

variable "bucket_prefix" {
  default = "home-depo"
}

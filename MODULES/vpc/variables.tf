variable "environment" {
    default = ""
}

variable "vpc_cidr" {
  type    = string
  default = ""
}

variable "subnet_1_cidr_pub" {
  type    = string
  default = ""
}

variable "subnet_2_cidr_pub" {
  type    = string
  default = ""
}

variable "subnet_1_cidr_pri" {
  type    = string
  default = ""
}

variable "subnet_2_cidr_pri" {
  type    = string
  default = ""
}

variable "route_cider" {
  type    = string
  default = "0.0.0.0/0"
}

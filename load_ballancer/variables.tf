variable "instance_type" {
  default = "t3.micro"
}

variable "environment" {
  default = ""
}

variable "ec2_subnet_id" {
  default = "10.10.1.0/24 "
}

variable "ec2_key" {
  default = "radostinpaskalev_key"
}

variable "ec2_security_groups" {
  default = []
  type    = list(any)
}

variable "ec2_iam_instance_profile" {
  default = null
}

variable "vpc_cidr_block" {
  default = "10.10.0.0/24"
}
variable "public_subnets" {
  type    = list(string)
  default = ["subnet_2_cidr_pub", "subnet_1_cidr_pub"]
}
variable "subnet_1_cidr_pub" {
  type    = string
  default = "10.10.2.0/24"

}

variable "subnet_2_cidr_pub" {
  type    = string
  default = "10.10.3.0/24"
}
variable "route_cider" {

  type = string

  default = "0.0.0.0/0"

}
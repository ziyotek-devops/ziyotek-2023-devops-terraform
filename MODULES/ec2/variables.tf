variable "instance_type" {
    default = "t3.micro"
}

variable "environment" {
    default = ""
}

variable "ec2_subnet_id" {
    default = ""
}

variable "ec2_key" {
    default = "radostinpaskalev_key"
}

variable "ec2_security_groups" {
    default = []
    type = list
}

variable "ec2_iam_instance_profile" {
    default = null
}
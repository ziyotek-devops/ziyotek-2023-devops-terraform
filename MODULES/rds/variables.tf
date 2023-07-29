variable "environment" {
    default = ""
}

variable "rds_storage_size" {
    default = 10
}

variable "rds_instance_class" {
    default = "db.t3.micro"
}

variable "admin_user" {
  default = "admin_user"
}

variable "rds_retention_period" {
    default = 3
}

variable "ec2_security_groups" {
    default = []
}

variable "ec2_subnet_id" {
    default = ""
}

variable "ec2_subnet_id_2" {
    default = ""
}
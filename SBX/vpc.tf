module "vpc" {
    source = "../MODULES/vpc"

    environment = var.environment
    vpc_cidr = "10.10.0.0/16"
    subnet_1_cidr_pub = "10.10.1.0/24"
    subnet_2_cidr_pub = "10.10.2.0/24"
    subnet_1_cidr_pri = "10.10.3.0/24"
    subnet_2_cidr_pri = "10.10.4.0/24"
}
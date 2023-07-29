module "vpc" {
    source = "../MODULES/vpc"

    environment = "prod"
    vpc_cidr = "10.20.0.0/16"
    subnet_1_cidr_pub = "10.20.1.0/24"
    subnet_2_cidr_pub = "10.20.2.0/24"
    subnet_1_cidr_pri = "10.20.3.0/24"
    subnet_2_cidr_pri = "10.20.4.0/24"
}
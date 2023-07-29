module "ec2" {
    source = "../MODULES/ec2"

    environment = var.environment
    instance_type = "t3.micro"

    ec2_subnet_id = module.vpc.public_subnet_id
    ec2_security_groups = [module.security_groups.security_group_id]
}
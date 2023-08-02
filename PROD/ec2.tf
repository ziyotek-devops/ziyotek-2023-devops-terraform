module "ec2" {
    source = "../MODULES/ec2"

    environment = var.environment
    instance_type = "t3.small"

    ec2_subnet_id = module.vpc.public_subnet_id
    ec2_security_groups = [module.security_groups.security_group_id]

    ec2_iam_instance_profile = module.iam.instance_profile_id
}
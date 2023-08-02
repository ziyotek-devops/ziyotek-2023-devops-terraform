module "rds" {
  source = "../MODULES/rds"

  environment        = var.environment
  rds_instance_class = "db.t3.small"
  rds_storage_size   = 15

  ec2_security_groups = [module.security_groups.security_group_id]

  ec2_subnet_id = module.vpc.public_subnet_id

  ec2_subnet_id_2 = module.vpc.public_subnet_id_2

}
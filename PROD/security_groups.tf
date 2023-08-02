module "security_groups" {
  source = "../MODULES/security-groups"

  environment = var.environment

  vpc_id = module.vpc.vpc_id
}
resource "aws_db_instance" "ziyo_db" {
  identifier = "${var.environment}-ziyotek-rds-instance"
  allocated_storage    = var.rds_storage_size
  db_name              = "${var.environment}_ziyo_db"
  port                 = "3306"
  engine               = "postgres"
  engine_version       = "13.9"
  instance_class       = var.rds_instance_class 
  username             = var.admin_user
  password             = aws_ssm_parameter.ziyo_ssm.value

  skip_final_snapshot  = true

  backup_retention_period = var.rds_retention_period
  backup_window = "21:46-10:16"

  db_subnet_group_name  = aws_db_subnet_group.ziyo_subnet.id
  vpc_security_group_ids = var.ec2_security_groups

  tags = {
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "ziyo_subnet" {
  name       = "${var.environment}_ziyo_sub_gr"
  subnet_ids = [var.ec2_subnet_id, var.ec2_subnet_id_2]

  tags = {
    Environment = var.environment
  }
}

resource "random_password" "ziyo_db_password" {
  length = 16
  special = true
  override_special = "_%@"
}

resource "aws_ssm_parameter" "ziyo_ssm" {
  name  = "/${var.environment}/ziyotek/database/password"
  type  = "SecureString"
  value = random_password.ziyo_db_password.result
  key_id = aws_kms_key.a.key_id
  tags = {
    Environment = var.environment
  }
}

resource "aws_kms_key" "a" {
  description             = "KMS key for ziyo 2023"
  deletion_window_in_days = 7
  tags = {
    Environment = var.environment
  }
}

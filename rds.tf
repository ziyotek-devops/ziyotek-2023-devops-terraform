resource "aws_db_instance" "default" {
  identifier = "ziyotek-rds-instance"
  allocated_storage    = 10
  db_name              = "ziyo_db"
  port                 = "3306"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.username
  password             = aws_ssm_parameter.ziyo_ssm.value
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  availability_zone = "us-east-1"
  backup_retention_period = 3 
  backup_window = "21:46-10:16"

  db_subnet_group_name  = aws_db_subnet_group.ziyo_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_all.id]
}

resource "aws_db_subnet_group" "ziyo_subnet" {
  name       = "ziyo_sub_gr"
  subnet_ids = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

resource "random_password" "ziyo_db_password" {
  length = 16
  special = true
  override_special = "_%@"
}

resource "aws_ssm_parameter" "ziyo_ssm" {
  name = "user-updates-topic"
  type = "SecureString"
  value = random_password.ziyo_db_password.result
  key_id = aws_kms_key.a.key_id
}

resource "aws_kms_key" "a" {
  description             = "KMS key for ziyo 2023"
  deletion_window_in_days = 7
}
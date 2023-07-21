resource "aws_db_instance" "ziyo_db" {
  identifier = "ziyotek-rds-instance"
  allocated_storage    = 10
  db_name              = "ziyo_db"
  port                 = "3306"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.admin_user
  password             = var.db_password 
#   parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
#   availability_zone = "us-east-1"
  backup_retention_period = 3
  backup_window = "21:46-10:16"
  
  db_subnet_group_name  = aws_db_subnet_group.ziyo_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_all.id]
}

resource "aws_db_subnet_group" "ziyo_subnet" {
  name       = "ziyo_sub_gr"
  subnet_ids = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}
output "rds_availability_zone" {
  value = aws_db_instance.ziyo_db.availability_zone
}

output "rds_port" {
  value = aws_db_instance.ziyo_db.port
}

output "rds_backup_window" {
  value = aws_db_instance.ziyo_db.backup_window
}

output "rds_id" {
  value = aws_db_instance.ziyo_db.id
}

output "rds_username" {
  value = aws_db_instance.ziyo_db.username
}
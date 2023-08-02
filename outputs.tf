
<<<<<<< HEAD
# output "rds_az" {
#   value = aws_db_instance.ziyo_db.availability_zone
# }

# output "rds_port" {
#   value = aws_db_instance.ziyo_db.port
# }
# output "rds_bw" {
#   value = aws_db_instance.ziyo_db.backup_window
# }
# output "rds_id" {
#   value = aws_db_instance.ziyo_db.identifier
# }
# output "rds_un" {
#   value = aws_db_instance.ziyo_db.username
# }
=======
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
>>>>>>> 45cc6fbd3a19ac7fe5cf87034aff90077dd1a5ac

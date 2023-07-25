output "availability_zone" {
    value = "us-east-1"
}

output "port" {
    value = "3306"
}

output "backup_window" {
    value = "21:46-10:16"
}

output "identifier" {
    value = "ziyotek-rds-instance"
  
}

output "username" {
    value = var.username
  
}
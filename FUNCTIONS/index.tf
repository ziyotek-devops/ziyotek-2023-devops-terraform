# locals {
#     names = [ "name1", "name2", "name3"]
# }

# variable "environment" {
#     default = "prod"
# }


# resource "aws_s3_bucket" "iqies_my_first_resourse" {
#   count = index(local.names, "name2")
#   bucket = "bucket-${var.environment}-etl-test2-${count.index}"
#   acl    = "private"
# }
# locals {
#     companies = [ "bucket-${var.environment}-etl-test1", "bucket-${var.environment}-etl-test2" ]
                
#     prod_bucket = "prod1-ready-ractor-base-s3-bucket"

#     bucket_count = contains(local.companies, var.company) ? 2 : 0
# }

# variable "environment" {
#     default = "prod1"
# }

# variable "company" {
#     default = "bucket-prod1-etl-test1"
# }

# resource "aws_s3_bucket" "iqies_my_first_resourse" {
#   count = local.bucket_count
#   bucket = "${local.prod_bucket}${count.index}"
#   acl    = "private"
# }

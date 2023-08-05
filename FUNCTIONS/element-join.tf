# locals {
#     bucket_names = [ "${local.company}", "${local.department}", "${local.instructor}" ]
                
#     company = "ziyotek"
#     department = "cloud"
#     instructor = "katherine"
# }

# variable "environment" {
#     default = "dev"
# }

# resource "aws_s3_bucket" "iqies_my_first_resourse" {
#   bucket = join("--", local.bucket_names)
#   acl    = "private"
# }

# resource "aws_s3_bucket" "iqies_my_second_resourse" {
#   bucket = "rady-ziyotek-bucket-${element(local.bucket_names, 7)}"
#   acl    = "private"
# }
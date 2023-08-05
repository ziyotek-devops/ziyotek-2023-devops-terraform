# locals {
#     non_prod = "${lower("HIDS-ADO4")}-${lower(replace(var.formula, "PROD-", "LLLLLL"))}-app-data-mgmnt-sg"
#     name = "${upper("bucket-for-bugs")}"
#     prod = "HIDS-ADO4-PROD--app_data_mgmnt_sg"
# }

# resource "aws_s3_bucket" "ziyo" {
#     bucket = "${local.non_prod}-known-issues"
#     #hids-ado4-dev-executions--app-data-mgmnt-sg-known-issues
  
#     acl = "private"
#     tags = {
#         Name = local.name
#     }
# }

# variable "formula" {
#     default = "DEV-EXECUTIONS"
# }


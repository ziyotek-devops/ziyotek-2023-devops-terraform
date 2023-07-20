# resource "aws_s3_bucket" "shihab_bucket_test" {
#   bucket              = var.s3_bucket_name
#   force_destroy       = true
#   object_lock_enabled = true
#   tags = {
#     Name        = "shihab"
#     Environment = "Prod"
#   }
# }

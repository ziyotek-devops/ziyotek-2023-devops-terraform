resource "aws_s3_bucket" "ziyo_bucket_gov" {
  bucket              = var.s3_bucket_name #"ziyotek-2023-bucket-rady"
  force_destroy       = true
  object_lock_enabled = true
  tags                = var.bucket_tags
}

resource "aws_s3_bucket" "ziyo_bucket" {
  bucket              = "ziyotek-2023-bucket-nicholas"
  force_destroy       = true
  object_lock_enabled = true
  tags = {
    Name        = "Nicholas"
    Environment = "Prod"
  }
}
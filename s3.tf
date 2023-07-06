resource "aws_s3_bucket" "ziyo_test-s3-odil" {
  bucket              = "ziyo-2023-odil-devops-s3"
  force_destroy       = true
  object_lock_enabled = true
  tags = {
    Name        = "Ziyo-Test-S3"
    Environment = "Devop"
  }
}
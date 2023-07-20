resource "aws_s3_bucket" "ziyo_test-s3-odil" {
  bucket = var.bucket_name
  #"ziyo-2023-odil-devops-s3"
  force_destroy       = true
  object_lock_enabled = true
  tags = {
    Name = var.tag_name
    #"Ziyo-Test-S3"
    Environment = "Devop"
  }
}

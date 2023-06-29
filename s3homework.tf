resource "aws_s3_bucket" "s3homework" {
  bucket = "ziyo2023-tf-bucket-boris"
  force_destroy = true
   object_lock_enabled = "true"
   
  tags = {
   Name        = "Boris"
    Environment = "Homework"
  }

}
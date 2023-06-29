resource "aws_s3_bucket" "ziyo_bucket" {
  bucket = "ziyotek-2023-first-homework-bucket-pb"

  force_destroy = true
  object_lock_enabled = true

   tags = {
    Name        = "Patricia"
    Environment = "ziyo"
  }
} 
    resource "aws_vpc" "ziyo_vpc" {
 cidr_block = "10.0.0.0/16"

 tags = {
   Name = "Patricia VPC"
 }
  }


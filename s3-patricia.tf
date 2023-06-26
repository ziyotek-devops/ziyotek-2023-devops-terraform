resource "aws_s3_bucket" "ziyo_bucket" {
  bucket = "ziyotek-2023-first-homework-bucket-pb"

   object_lock_enabled = true
   force_destroy = true
   
   tags = {
    Name        = "homework-patricia"
    Environment = "ziyo"
  }
}
  module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
}


resource "aws_s3_bucket" "ziyo_bucket" {
  bucket = "ziyotek-2023-first-homework-bucket-pb"

  force_destroy = true
  
  object_lock_configuration = {
   object_lock_enabled = "Enabled"
  }
   
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


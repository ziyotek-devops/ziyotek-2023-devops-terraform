locals {
  s3_prefix = var.environment
  body      = "${local.s3_prefix}-ziyotek"
}

resource "aws_s3_bucket" "ziyo_bucket_gov" {
  count         = var.environment == "prod" ? 2 : 3
  bucket        = "${local.s3_prefix}-ziyotek-2023-spring-class-devops-${count.index}"
  force_destroy = true
  tags = {
    Environment   = var.environment
    Bucket_number = "${count.index}"
  }
}

variable "environment" {
  default = "test"
}

data "aws_region" "current" {}

resource "random_pet" "server" {}


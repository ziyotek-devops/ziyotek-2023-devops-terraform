locals {
    s3_prefix = "${var.environment}"
    body = "${local.s3_prefix}-ziyotek"
}

resource "aws_s3_bucket" "ziyo_bucket_gov" {
  count = var.environment == "sbx" ? 1 : 0
  bucket              = "${local.s3_prefix}-ziyotek-2023-spring-class-devops"
  force_destroy       = true
  tags                = {
        Environment = var.environment
    }
  lifecycle {
    ignore_changes = [tags]
  }
}


data "aws_region" "current" {}

resource "random_pet" "server" {}

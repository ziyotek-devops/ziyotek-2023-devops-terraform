locals {
    s3_prefix = "ziyotek-2023-spring"

    s3_tags = {
        purpose = "training"
        teniure = var.admin_user
        prefix  = local.s3_prefix
    }
    last_name  = "yeyeyeye"
    patricia = "${local.s3_prefix}-${local.last_name}"
}

resource "aws_s3_bucket" "ziyo_bucket_gov" {
  bucket              = "${local.s3_prefix}-${local.patricia}-${random_pet.server.id}"
  force_destroy       = true
  object_lock_enabled = true
  tags                = {
        purpose = "work"
        teniure = "forever"
    }
  lifecycle {
    ignore_changes = [tags]
  }
}


data "aws_region" "current" {}

resource "random_pet" "server" {}

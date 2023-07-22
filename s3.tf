resource "aws_s3_bucket" "ziyo_bucket_gov" {
  bucket              = "${var.bucket_prefix}-${data.aws_region.current.name}-${random_pet.server.id}"
  force_destroy       = true
  object_lock_enabled = true
  tags                = var.bucket_tags
}

data "aws_region" "current" {}

resource "random_pet" "server" {}

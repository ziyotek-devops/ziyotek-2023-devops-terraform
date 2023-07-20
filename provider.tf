provider "aws" {
  region = "us-east-1"
}

# terraform {
#   required_version = "~> 1.2.2"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.4"
#     }
#   }

#   backend "s3" {
#     bucket  = "ziyotek-terraform-state-rady-host"
#     key     = "ec2-examle/devops/terraform.tfstate"
#     region  = "us-east-1"
#     encrypt = true
#   }
# }
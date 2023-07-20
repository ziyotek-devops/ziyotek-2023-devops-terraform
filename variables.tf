variable "bucket_name" {
  default = "ziyo-2023-odil-devops-s3"

}

variable "tag_name" {
  default = "Ziyo-Test-S3"
}

variable "key_name" {
  default = "testAWS"
}

variable "ami_id" {
  default = "ami-06b09bfacae1453cb"
}

variable "instance_type" {
  default = "t3.micro"
  type    = string
}

variable "cidr_block" {
  default = "10.10.0.0/16"
}

variable "vpc_id" {
  default = "aws_vpc.ziyo_vpc.id"
}
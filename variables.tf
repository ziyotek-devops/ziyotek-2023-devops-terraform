variable "ec2_key" {
  type        = string
  description = "an ec2 instance key for ssh"
  default     = "radostinpaskalev_key"
}

variable "s3_bucket_name" {
  type    = string
  default = "ziyotek-2023-bucket-rady-class"
}

variable "cidr_ips" {
  type    = list(any)
  default = ["0.0.0.0/0", "10.10.123.12/32"]
}

variable "bucket_tags" {
  type = map(any)
  default = {
    Name        = "Nicholas"
    Environment = "Prod"
  }
}

variable "general_tag" {
  type = map(any)
  default = {
    company = "ziyotek_2023_spring"
  }
}



variable "bucket_prefix" {
  default = "home-depo"
}

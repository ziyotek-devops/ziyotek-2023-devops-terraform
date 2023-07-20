variable "ec2_key" {
  type        = string
  description = "an ec2 instance key for ssh"
  default     = "DemoAWS"
}

variable "s3_bucket_name" {
  type    = string
  default = "ziyotek-2023-bucket-shihab"
}

variable "tag_name" {
  default = "han"
}

variable "environment_name" {
  default = "Shihab510"

}

variable "force_destroy" {
  default = "true"
}

variable "object_lock_enabled" {
  default = "false"

}

variable "instance_type" {
  default = "t3.micro"
  type    = string
} 
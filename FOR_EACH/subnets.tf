

resource "aws_vpc" "ziyo_vpc" {
  for_each   = var.cidrs
  cidr_block = each.value
  tags = {
    Environment = each.key
    CIDR        = each.value
  }
}

variable "cidrs" {
    type = map(any)
  default = {
    sbx      = "10.10.10.0/24", 
    test     = "10.10.20.0/24",
    pre-prod = "10.10.30.0/24",
    prod     = "10.10.40.0/24"
  # key      = value
  }
}

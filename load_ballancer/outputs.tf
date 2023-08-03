output "security_group_id" {
  value = aws_security_group.allow_all.id
}

# output "public_subnet_id" {
#     value = aws_subnet.public_subnet_1.id
# }

output "vpc_id" {
  value = aws_vpc.ziyo_vpc.id
}

# output "public_subnet_id_2" {
#     value = aws_subnet.public_subnet_2.id
# }
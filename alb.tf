# resource "aws_launch_configuration" "web_tier_lc" {
#   name          = "web-tier-lc"
#   image_id      = "ami-06b09bfacae1453cb"
#   instance_type = "t3.micro"
#   iam_instance_profile = aws_iam_instance_profile.ziyo_profile.id
#   associate_public_ip_address = true
#   user_data                   = file("old.sh")
#   key_name = var.ec2_key
#   security_groups = [aws_security_group.allow_all.id]
# }

# resource "aws_autoscaling_group" "ziyo_asg" {
#   name                      = "web-tier-asg"
#   max_size                  = 2
#   min_size                  = 1
#   desired_capacity          = 1

#   force_delete              = false
#   launch_configuration      = aws_launch_configuration.web_tier_lc.name
#   vpc_zone_identifier       = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
# }
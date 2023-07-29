resource "aws_instance" "ziyote_ec2_first" {
  ami           = data.aws_ami.example.id 
  instance_type = var.instance_type              #t2.micro does not support ebs opt/monitoring

  subnet_id = var.ec2_subnet_id
  key_name  = var.ec2_key
  # we will be using the heredoc syntax
  vpc_security_group_ids = var.ec2_security_groups

  #iam_instance_profile = aws_iam_instance_profile.ziyo_profile.id

	# user_data = <<EOF
	# 	#!/bin/sh
  #   sudo apt-get update -y
	# 	sudo apt-get install -y apache2
	# 	sudo systemctl start apache2
	# 	sudo systemctl enable apache2
	# 	echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	# EOF
 user_data                   = file("../MODULES/scripts/old.sh")
  associate_public_ip_address = true

  tags = {
    Environment = var.environment
  }
  lifecycle {
    create_before_destroy = true
  }
}


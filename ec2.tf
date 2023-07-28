resource "aws_instance" "ziyote_ec2_first" {
  ami           = data.aws_ami.example.id 
  instance_type = "t3.micro"              #t2.micro does not support ebs opt/monitoring

  subnet_id = aws_subnet.public_subnet_1.id
  key_name  = aws_key_pair.deployer.id #var.ec2_key #"radostinpaskalev_key"
  # we will be using the heredoc syntax
  vpc_security_group_ids = [
    aws_security_group.allow_all.id
  ]
  iam_instance_profile = aws_iam_instance_profile.ziyo_profile.id

	# user_data = <<EOF
	# 	#!/bin/sh
  #   sudo apt-get update -y
	# 	sudo apt-get install -y apache2
	# 	sudo systemctl start apache2
	# 	sudo systemctl enable apache2
	# 	echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	# EOF
 user_data                   = file("old.sh")
  associate_public_ip_address = true
  # ebs_optimized               = true
  # monitoring                  = true
  tags = {
    Name = "Ziyo_first_instance"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "tls_private_key" "ziyo_example" {
  algorithm   = "RSA"
  rsa_bits    = "4096"

  provisioner "local-exec" {
    when    = create
    command = "echo '${self.private_key_pem}' > /d/Keys/deployer-key"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.ziyo_example.public_key_openssh
}


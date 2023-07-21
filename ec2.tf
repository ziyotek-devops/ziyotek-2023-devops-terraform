resource "aws_instance" "ziyote_ec2_first" {
  ami           = "ami-06b09bfacae1453cb" #works ONLY in us-east-1
  instance_type = "t3.micro"              #t2.micro does not support ebs opt/monitoring

  subnet_id = aws_subnet.public_subnet_1.id
  key_name  = var.ec2_key #"radostinpaskalev_key"
  # we will be using the heredoc syntax
  vpc_security_group_ids = [
    aws_security_group.allow_all.id
  ]
  iam_instance_profile = aws_iam_instance_profile.ziyo_profile.id

  # user_data                   = <<EOF
  # #!/bin/bash
  # sudo yum update -y
  # sudo yum install -y httpd
  # sudo systemctl start httpd.service
  # sudo systemctl enable httpd.service
  # sudo echo "</h1> At $(hostname -f) </h1>" > /var/www/html/index.html
  # EOF
  user_data                   = file("userdata.sh")
  associate_public_ip_address = true
  # ebs_optimized               = true
  # monitoring                  = true
  tags = {
    Name = "Ziyo_first_instance"
  }
}

# resource "tls_private_key" "ziyo_example" {
#   algorithm   = "RSA"
#   rsa_bits    = "4096"
# }

# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer-key"
#   public_key = tls_private_key.ziyo_example.public_key_openssh
# }

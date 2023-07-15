resource "aws_instance" "ziyote_ec2_first" {
  ami           = "ami-06b09bfacae1453cb" #works ONLY in us-east-1
  instance_type = "t3.micro" #t2.micro does not support ebs opt/monitoring

  subnet_id = aws_subnet.public_subnet_1.id
  key_name  = "Demokey"
  # we will be using the heredoc syntax
  vpc_security_group_ids = [
    aws_security_group.ziyo_allow_https.id
    ]
  
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
  ebs_optimized               = true
  monitoring                  = true
  tags = {
    Name = "Ziyo_first_instance"
  }
}


resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow ALL inbound traffic"
  depends_on  = [aws_vpc.ziyo_vpc]
  vpc_id      = aws_vpc.ziyo_vpc.id

  ingress {
    description = "All from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
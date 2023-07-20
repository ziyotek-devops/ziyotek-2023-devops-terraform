resource "aws_instance" "ziyote_ec2_first" {
  ami           = "ami-06b09bfacae1453cb" #works ONLY in us-east-1
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_1.id
  key_name      = var.ec2_key
  # we will be using the heredoc syntax
  vpc_security_group_ids = [
    aws_security_group.ziyo_allow_https.id
  ]

  user_data = <<-EOF
  #!/bin/bash
  sudo su
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  systemctl stop firewalld
  systemctl restart httpd
  echo "<html><h1 align="center"> <center> Welcome to my website. Hello There... </center> </h1></html>" >> /var/www/html/index.html
  EOF
  #user_data                   = file("userdata.sh")
  associate_public_ip_address = true
  ebs_optimized               = true
  monitoring                  = true
  tags = {
    Name = var.environment_name
  }
}


resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow ALL inbound traffic"
  depends_on  = [aws_vpc.ziyo_vpc]
  vpc_id      = aws_vpc.ziyo_vpc.id

  ingress {
    description = "All from VPC"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  resource "aws_security_group" "sg_8080" {
   name = "Allow 8080"

-  ingress {
-    from_port       = 8080
-    to_port         = 8080
-    protocol        = "tcp"
-    security_groups = [aws_security_group.ziyo_allow_https.id]
-  }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
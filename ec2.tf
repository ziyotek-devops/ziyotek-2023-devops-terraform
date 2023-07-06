resource "aws_instance" "ziyo-odil-ec2" {
  ami           = "ami-06b09bfacae1453cb"
  instance_type = "t2.micro"
  #subnet_id = aws_subnet.public_subnet_1.id
  key_name = "testAWS"
  # we will be using the heredoc syntax
  user_data = <<EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install -y httpd
  sudo systemctl start httpd.service
  sudo systemctl enable httpd.service
  sudo echo "<h1> At $(hostname -f) </h1>" > /var/www/html/index.html
  EOF

  associate_public_ip_address = true
  tags = {
    Name = "Ziyo-Odil-Ec2"
  }
}
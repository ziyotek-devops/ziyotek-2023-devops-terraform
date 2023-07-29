resource "aws_security_group" "allow_all" {
  name        = "${var.environment} allow_all"
  description = "Allow ALL inbound traffic"

  vpc_id      = var.vpc_id

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
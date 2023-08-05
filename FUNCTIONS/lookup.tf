# this resource will create a separate ec2 instance in th edefault VPC. It will error is a default VPC doesnt exist. 

resource "aws_instance" "web" {
  ami = lookup(var.amis, var.region, "us-west-2")

  #subnet_id     = aws_subnet.my_subnet_1.id
  instance_type = "t3.micro"
  #vpc_security_group_ids = [aws_security_group.allow_all.id]
}

variable "amis" {
    type = map
    default = {
        # us-east-1 = "ami-0f34c5ae932e6f0e4",
        us-west-1 = "ami-0c38b9e37c107d921",
        us-east-2 = "ami-02a89066c48741345",
    }
}

variable "region" {
    default = "us-east-1"
}

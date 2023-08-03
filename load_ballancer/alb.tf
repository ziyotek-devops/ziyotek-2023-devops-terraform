resource "aws_launch_configuration" "web_tier_lc" {
  name                        = "web-tier-lc"
  image_id                    = data.aws_ami.example.id
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.ziyo_profile.id
  associate_public_ip_address = true
  user_data                   = file("old.sh")
  key_name                    = var.ec2_key
  security_groups             = [aws_security_group.allow_all.id]
}

resource "aws_autoscaling_group" "ziyo_asg" {
  name             = "web-tier-asg"
  max_size         = 2
  min_size         = 1
  desired_capacity = 1

  force_delete         = false
  launch_configuration = aws_launch_configuration.web_tier_lc.name
  vpc_zone_identifier  = var.public_subnets
}

resource "aws_lb" "ziyo_alb" {
  name               = "web-tier-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_all.id]

}

resource "aws_lb_listener" "ziyo_listener" {
  load_balancer_arn = aws_lb.ziyo_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ziyo_tg.arn
  }
}

resource "aws_lb_listener_rule" "ziyo_rule" {
  listener_arn = aws_lb_listener.ziyo_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ziyo_tg.arn
  }

  condition {
    path_pattern {
      values = ["/static/*"]
    }
  }
}

resource "aws_lb_target_group" "ziyo_tg" {
  name     = "web-tier-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ziyo_vpc.id
}

resource "aws_autoscaling_attachment" "ziyo_attch" {
  autoscaling_group_name = aws_autoscaling_group.ziyo_asg.id
  lb_target_group_arn    = aws_lb_target_group.ziyo_tg.arn
}
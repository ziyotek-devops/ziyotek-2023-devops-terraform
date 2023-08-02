resource "aws_launch_configuration" "web_tier_lc" {
  name                        = "web-tier-lc"
  image_id                    = data.aws_ami.example.id
  instance_type               = "t3.micro"
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
  vpc_zone_identifier  = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

resource "aws_lb" "ziyo_alb" {
  name               = "web-tier-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_all.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
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

resource "aws_cloudwatch_dashboard" "EC2_Dashboard" {
  dashboard_name = "EC2-Dashboard"

  dashboard_body = <<EOF
{
    "widgets": [
        {
            "type": "explorer",
            "width": 24,
            "height": 15,
            "x": 0,
            "y": 0,
            "properties": {
                "metrics": [
                    {
                        "metricName": "CPUUtilization",
                        "resourceType": "AWS::EC2::Instance",
                        "stat": "Maximum"
                    }
                ],
                "aggregateBy": {
                    "key": "InstanceType",
                    "func": "MAX"
                },
                "labels": [
                    {
                        "key": "State",
                        "value": "running"
                    }
                ],
                "widgetOptions": {
                    "legend": {
                        "position": "bottom"
                    },
                    "view": "timeSeries",
                    "rowsPerPage": 8,
                    "widgetsPerRow": 2
                },
                "period": 60,
                "title": "Running EC2 Instances CPUUtilization"
            }
        }
    ]
}
EOF
}

resource "aws_cloudwatch_composite_alarm" "EC2" {
  alarm_description = "Composite alarm that monitors CPUUtilization "
  alarm_name        = "EC2_Composite_Alarm"
  alarm_actions     = [aws_sns_topic.EC2_topic.arn]

  alarm_rule = "ALARM(${aws_cloudwatch_metric_alarm.EC2_CPU_Usage_Alarm.alarm_name})"

  depends_on = [
    aws_cloudwatch_metric_alarm.EC2_CPU_Usage_Alarm,
    aws_sns_topic.EC2_topic,
    aws_sns_topic_subscription.EC2_Subscription
  ]
}

# Creating the AWS CLoudwatch Alarm that will autoscale the AWS EC2 instance based on CPU utilization.
resource "aws_cloudwatch_metric_alarm" "EC2_CPU_Usage_Alarm" {
  # defining the name of AWS cloudwatch alarm
  alarm_name          = "EC2_CPU_Usage_Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  # Defining the metric_name according to which scaling will happen (based on CPU) 
  metric_name = "CPUUtilization"
  # The namespace for the alarm's associated metric
  namespace = "AWS/EC2"
  # After AWS Cloudwatch Alarm is triggered, it will wait for 60 seconds and then autoscales
  period    = "60"
  statistic = "Average"
  # CPU Utilization threshold is set to 10 percent
  threshold         = "70"
  alarm_description = "This metric monitors ec2 cpu utilization exceeding 70%"
}

resource "aws_cloudwatch_log_group" "ebs_log_group" {
  name              = "ebs_log_group"
  retention_in_days = 30
}


resource "aws_cloudwatch_log_stream" "ebs_log_stream" {
  name           = "ebs_log_stream"
  log_group_name = aws_cloudwatch_log_group.ebs_log_group.name
}


resource "aws_sns_topic" "EC2_topic" {
  name = "EC2_topic"
}

resource "aws_sns_topic_subscription" "EC2_Subscription" {
  topic_arn = aws_sns_topic.EC2_topic.arn
  protocol  = "email"
  endpoint  = "rpaskalev@ziyotek.net"

  depends_on = [
    aws_sns_topic.EC2_topic
  ]
}

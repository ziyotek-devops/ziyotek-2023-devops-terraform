resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "70" # Adjust this threshold value as per your requirement
  alarm_description   = "Alarm when CPU utilization exceeds 70%"
  alarm_name          = "ziyo-cpu-utilization-alarm"
  alarm_actions       = [aws_autoscaling_policy.ziyo_scale_out_policy.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ziyo_asg.name
  }
}

resource "aws_autoscaling_policy" "ziyo_scale_out_policy" {
  name                      = "ziyo-scale-out-policy"
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 60
  autoscaling_group_name    = aws_autoscaling_group.ziyo_asg.name

  target_tracking_configuration {
    target_value = 50
    customized_metric_specification {
      metrics {
        label = "Get the queue size (the number of messages waiting to be processed)"
        id    = "m1"
        metric_stat {
          metric {
            namespace   = "AWS/SQS"
            metric_name = "ApproximateNumberOfMessagesVisible"
            dimensions {
              name  = "QueueName"
              value = "my-queue"
            }
          }
          stat = "Sum"
        }
        return_data = false
      }
      metrics {
        label = "Get the group size (the number of InService instances)"
        id    = "m2"
        metric_stat {
          metric {
            namespace   = "AWS/AutoScaling"
            metric_name = "GroupInServiceInstances"
            dimensions {
              name  = "AutoScalingGroupName"
              value = "my-asg"
            }
          }
          stat = "Average"
        }
        return_data = false
      }
      metrics {
        label       = "Calculate the backlog per instance"
        id          = "e1"
        expression  = "m1 / m2"
        return_data = true
      }
    }
  }
}
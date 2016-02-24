CloudWatch do
  Type  "AWS::CloudWatch::Alarm"
  Properties do
    AlarmDescription "CPU Alarm For Your Instance."
    AlarmActions [
      _{
        Ref "SNSCwAlert"
      }
    ]
    MetricName "CPUUtilization"
    Namespace "AWS/EC2"
    Statistic "Maximum"
    Period "300"
    EvaluationPeriods "1"
    Threshold "85"
    ComparisonOperator "GreaterThanThreshold"
    Dimensions [
      _{
        Name "InstanceId"
        Value do
          Ref "EC2"
        end
      }
    ]
  end
end

ASHighCPUAlearm do
	Type	"AWS::CloudWatch::Alarm"
	Properties do
		AlarmDescription "CPU Alarm For Your Instance."
		AlarmActions [
			_{
				Ref "AutoScaleUpPolicy"
			}
		]
		MetricName "CPUUtilization"
		Namespace "AWS/EC2"
		Statistic "Maximum"
		Period "300"
		EvaluationPeriods "1"
		Threshold "60"
		ComparisonOperator "GreaterThanThreshold"
		Dimensions [
			_{
				Name "AutoScalingGroupName"
				Value do
					Ref "ASGroup"
				end
			}
		]
	end
end

ASLowCPUAlearm do
	Type	"AWS::CloudWatch::Alarm"
	Properties do
		AlarmDescription "CPU Alarm For Your Instance."
		AlarmActions [
			_{
				Ref "AutoScaleDownPolicy"
			}
		]
		MetricName "CPUUtilization"
		Namespace "AWS/EC2"
		Statistic "Maximum"
		Period "300"
		EvaluationPeriods "1"
		Threshold "30"
		ComparisonOperator "LessThanThreshold"
		Dimensions [
			_{
				Name "AutoScalingGroupName"
				Value do
					Ref "ASGroup"
				end
			}
		]
	end
end

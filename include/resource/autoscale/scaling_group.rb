ASGroup do
	Type "AWS::AutoScaling::AutoScalingGroup"
	Properties do
		Cooldown "600"
		DesiredCapacity "2"
		HealthCheckType "EC2"
		MaxSize "10"
		MinSize "0"
		AvailabilityZones [
			_{
				Ref "AvailabilityZone"
			}
		]
		Tags [
			_{
				Key "Application"
				Value do
					Ref "AWS::StackName"
				end
				PropagateAtLaunch true
			},
			_{
				Key "Name"
				Value "AutoScale"
				PropagateAtLaunch true
			}
		]
		LaunchConfigurationName do
			Ref "ASLaunchConfig"
		end
		VPCZoneIdentifier [
			_{
				Ref "PublicSubnet"
			}
		]
		LoadBalancerNames [
			_{
				Ref "ELB"
			}
		]
		NotificationConfigurations [
			_{
				NotificationTypes [
					"autoscaling:EC2_INSTANCE_LAUNCH",
					"autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
					"autoscaling:EC2_INSTANCE_TERMINATE",
					"autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
					"autoscaling:TEST_NOTIFICATION"
				]
				TopicARN do
					Ref "SNSAutoScaling"
				end
			}
		]
	end
end

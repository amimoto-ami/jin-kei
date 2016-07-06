ASGroup do
	Type "AWS::AutoScaling::AutoScalingGroup"
	Properties do
		Cooldown "600"
		DesiredCapacity do
			Ref "AutoScalingDesiredCapacity"
		end
		HealthCheckType "EC2"
		MaxSize do
			Ref "AutoScalingMaxSize"
		end
		MinSize do
			Ref "AutoScalingMinSize"
		end
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

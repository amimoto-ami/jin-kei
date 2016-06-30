SNSAutoScaling do
	Type "AWS::SNS::Topic"
	Properties do
		DisplayName do
			Fn__Join [
				"-",
				[
					_{
						Ref "AWS::StackName"
					},
					"AutoScaling"
				]
			]
		end
		TopicName do
			Fn__Join [
				"-",
				[
					_{
						Ref "AWS::StackName"
					},
					"AutoScaling"
				]
			]
		end
	end
end

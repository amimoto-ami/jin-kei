_include "include/iam/roles/codedeploy.rb"

AmimotoDeploy do
	Type "AWS::CodeDeploy::Application"
end

AmimotoDeploymentGroup do
	Type "AWS::CodeDeploy::DeploymentGroup"
	Properties do
		ApplicationName do
			Ref "AmimotoDeploy"
		end
		AutoScalingGroups [
			_{
				Ref "AutoScalingGroup"
			}
		]
		Ec2TagFilters [
			_{
				Key "AmimotoDeploy"
				Type "KEY_AND_VALUE"
				Value  do
					Ref "AWS::StackName"
				end
			}
		]
		DeploymentConfigName "CodeDeployDefault.OneAtATime"
		#Deployment do
		#	Description "This is AutoScaling Depolyment."
		#	# IgnoreApplicationStopFailures TRUEorFALSE
		#	Revision do
		#		# @TODO CodeCommitがCloudFormationに対応したらここを設定する
		#	end
		#
		#end
		ServiceRoleArn do
			Fn__GetAtt "IAMRoleForCodeDeploy", "Arn"
		end
	end
end

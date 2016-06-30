ASLaunchConfig do
	Type "AWS::AutoScaling::LaunchConfiguration"
	Properties do
		IamInstanceProfile do
			Ref "IAMForEC2"
		end
		ImageId do
			Fn__FindInMap [
				"MPAmimotov4",
				_{ Ref "AWS::Region" },
				"AMI"
			]
		end
		InstanceType {
			Ref "InstanceType"
		}
		SecurityGroups [
			_{
				Ref "SecurityGroupInstance"
			},
			_{
				Ref "SecurityGroupInternal"
			}
		]
		KeyName {
			Ref "KeyName"
		}
		UserData do
			Fn__Base64 do
				Fn__Join [
					"",
					[
						"#!/bin/bash\n",
						"/opt/aws/bin/cfn-init -s ",
						_{
						  Ref "AWS::StackName"
						},
						" -r EC2 ",
						" --region ",
						_{
						  Ref "AWS::Region"
						},
						"\n",
						"yum install -y nfs-utils\n",
						"mount -t nfs4 -o nfsvers=4.1 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).",
						_{ Ref "EFSFileSystem" },
						".efs.",
						_{
						  Ref "AWS::Region"
						},
						".amazonaws.com:/ /var/www/vhosts\n",
						"until find /var/www/vhosts -name wp-config.php  ; do sleep 5 ; done", "\n",
					]
				]
			end
		end
	end
end

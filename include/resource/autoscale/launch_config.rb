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
						".amazonaws.com:/ /var/www/html\n",

						## Change web document root dir
						"tmp_json=`mktemp`\n",
						"amimoto_json='/opt/local/amimoto.json'\n",
						"json='{\"wordpress\":{\"document_root\":\"/var/www/html\"}}'\n",
						"[ ! -e /opt/local ] && /bin/mkdir -p /opt/local\n",
						"if [ -f $amimoto_json ]; then\n",
						"  hash jq || /usr/bin/yum install -y jq\n",
						"  /usr/bin/jq -s '.[0] * .[1]' $amimoto_json <(echo $json) > $tmp_json\n",
						"else\n",
						"  echo $json > $tmp_json\n",
						"fi\n",
						"[ -f $tmp_json ] && /bin/mv -f $tmp_json $amimoto_json\n",

						## Waite for Download WordPress
						"until [ `find /var/www/html -name local-salt.php` ]\n",
						"do\n",
						"sleep 5\n",
						"done\n",
						"sleep 5\n",
					]
				]
			end
		end
	end
end

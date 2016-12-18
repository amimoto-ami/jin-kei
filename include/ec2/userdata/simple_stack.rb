  Fn__Base64 do
	Fn__Join [
	  "",
	  [
			"#!/bin/bash\n",

			"# Get the latest CloudFormation package\n",
			"yum install -y aws-cfn-bootstrap\n",

			"# Start cfn-init\n",
      "/opt/aws/bin/cfn-init -s ",
			_{
				Ref "AWS::StackName"
			},
			" -r EC2 ",
			" --region ",
			_{
				Ref "AWS::Region"
			},
			" || error_exit 'Failed to run cfn-init'\n",

			"# Start up the cfn-hup daemon to listen for changes to the EC2 instance metadata\n",
			"/opt/aws/bin/cfn-hup || error_exit 'Failed to start cfn-hup'\n",

			"\n",
			"until find /var/www/vhosts -name wp-config.php  ; do sleep 5 ; done", "\n",
			"/opt/aws/bin/cfn-signal -e $? -r \"WordPress setup complete\" '",
			_{ Ref "EC2WaitHandle" }, "'\n"
	  ]
	]
  end

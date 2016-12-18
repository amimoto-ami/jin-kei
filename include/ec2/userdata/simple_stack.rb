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
			"until find /var/www/vhosts -name wp-config.php  ; do sleep 5 ; done", "\n",
			"/opt/aws/bin/cfn-signal -e $? -r \"WordPress setup complete\" '",
			_{ Ref "EC2WaitHandle" }, "'\n"
	  ]
	]
  end

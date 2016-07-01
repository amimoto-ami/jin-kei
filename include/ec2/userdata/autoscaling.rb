
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

		## Setup NFSv4 for EFS
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

		"until find /var/www/html -name wp-config.php  ; do sleep 5 ; done", "\n",
		"/opt/aws/bin/cfn-signal -e $? -r \"WordPress setup complete\" '",
		_{ Ref "EC2WaitHandle" }, "'\n"
	  ]
	]
  end

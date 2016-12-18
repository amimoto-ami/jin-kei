_path("/opt/aws/cloud_formation.json") do
	content '{
	  "rds" : {
		"database" : "wordpress",
		"username" : "amimoto",
		"password" : "{{password}}",
		"endpoint" : "{{endpoint}}",
		"port"     : 3306
	  },
	  "s3_conf": {
		  "region": "{{s3region}}",
		  "bucket": "{{s3bucket}}",
		  "url": "{{s3url}}",
		  "storage": "STANDARD"
	  }
	}'
  context do
		endpoint do
			Fn__GetAtt "RDS", "Endpoint.Address"
		end
		password do
			Ref "MySQLPassword"
		end
		serverid "dummy(value_will_update_by_AmimotoFrontLC)"
		s3bucket do
			Ref "S3Media"
		end
		s3url do
			Fn__GetAtt "S3Media", "WebsiteURL"
		end
		s3region do
			Ref "AWS::Region"
		end
  end
  mode "00644"
  owner "root"
  group "root"
end

_path("/etc/cfn/cfn-hup.conf") do
  content '[main]
stack={{stackArn}}
region={{region}}'
  mode "000400"
	owner "root"
  group "root"
	context do
		stackArn do
			Ref "AWS::StackId"
		end
		region do
			Ref "AWS::Region"
		end
  end
end

_path("/etc/cfn/hooks.d/cfn-auto-reloader.conf") do
  content '[cfn-auto-reloader-hook]
triggers=post.update
path=Resources.{{resources}}.Metadata.AWS::CloudFormation::Init
action=/opt/aws/bin/cfn-init -s {{stackArn}} -r {{resources}} --region {{region}}
runas=root'
	context do
		stackArn do
			Ref "AWS::StackId"
		end
		region do
			Ref "AWS::Region"
    end
    resources do
      if $Stack_Type == 'autoscale' then
        "ASLaunchConfig"
      else
        "EC2"
      end
    end
  end
end
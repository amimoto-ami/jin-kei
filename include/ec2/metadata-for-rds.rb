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
action=/opt/aws/bin/cfn-init -s {{stackArn}} -r {{resources}} --region {{region}}  --configsets provision
runas=root'
	context do
		stackArn do
			Ref "AWS::StackId"
		end
		region do
			Ref "AWS::Region"
        end
        if $Stack_Type == 'autoscale' then
          resources "ASLaunchConfig"
        else
          resources "EC2"
        end
    end
end

if $Stack_Type == 'autoscale' then
    _path("/tmp/cwlogs/logs.conf") do
        content '[general]
state_file = /var/awslogs/agent-state

[/var/log/messages]
datetime_format = %b %d %H:%M:%S
file = /var/log/messages
buffer_duration = 5000
log_stream_name = /var/log/messages
log_group_name = {{webServerLogGroup}}

[/var/log/php-fpm/www-error.log]
datetime_format = %d/%b/%Y:%H:%M:%S %z
file = /var/log/php-fpm/www-error.log
buffer_duration = 5000
log_stream_name = /var/log/php-fpm/www-error.log
multi_line_start_pattern = {datetime_format}
log_group_name = {{webServerLogGroup}}

[/var/log/nginx/{instance_id}.backend.access.log]
datetime_format = %d/%b/%Y:%H:%M:%S %z
file = /var/log/nginx/*.backend.access.log
buffer_duration = 5000
log_stream_name = /var/log/nginx/{instance_id}.backend.access.log
log_group_name = {{webServerLogGroup}}

[/var/log/nginx/{instance_id}.access.log]
datetime_format = %d/%b/%Y:%H:%M:%S %z
file = /var/log/nginx/*.access.log
buffer_duration = 5000
log_stream_name = /var/log/nginx/{instance_id}.access.log
log_group_name = {{webServerLogGroup}}

[/var/log/nginx/{instance_id}.error.log]
datetime_format = %d/%b/%Y:%H:%M:%S %z
file = /var/log/nginx/*.error.log
buffer_duration = 5000
log_stream_name = /var/log/nginx/{instance_id}.error.log
log_group_name = {{webServerLogGroup}}'
        context do
            webServerLogGroup do
                Ref "CWLogs"
            end
        end
        mode "000400"
        owner "root"
        group "root"
    end
end

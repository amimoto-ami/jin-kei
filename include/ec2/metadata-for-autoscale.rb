_path("/opt/aws/cloud_formation_stg.json") do
	content '{
	  "rds" : {
		"database" : "wordpress_stg",
		"username" : "amimoto",
		"password" : "{{password}}",
		"endpoint" : "{{endpoint}}",
		"port"     : 3306
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
  end
  mode "00644"
  owner "root"
  group "root"
end

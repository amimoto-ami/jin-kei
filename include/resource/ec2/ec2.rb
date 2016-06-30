EC2 do
  Type "AWS::EC2::Instance"
  DependsOn "AttachGatewayToVPC"
  Metadata do
    AWS__CloudFormation__Init do
      config do
        files do
          _path("/opt/aws/cf_option.json") do
              content '{
                "option" : {
                  "cloudfront" : "true"
                }
              }'
            mode "00644"
            owner "root"
            group "root"
          end
          if $DB_TYPE == 'rds' then
            _include "include/ec2/metadata-for-rds.rb"
          elsif $DB_TYPE == 'aurora' then
            _include "include/ec2/metadata-for-aurora.rb"
          end
        end
      end
    end
  end
  Properties do
  	_include "include/ec2/default-prop.rb"
    Tags [
      _{
        Key "Application"
        Value do
          Ref "AWS::StackName"
        end
      },
      _{
        Key "HasRDS"
        Value "true"
	  }
    ]
  end
end

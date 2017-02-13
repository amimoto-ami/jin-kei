EC2 do
  Type "AWS::EC2::Instance"
  DependsOn "AttachGatewayToVPC"
  Metadata do
    AWS__CloudFormation__Init do
      default do
        files do
		  _include "include/ec2/metadata-for-rds.rb"
        end
      end
      do_provision do
        commands do
          do_provision do
            command "/opt/local/provision"
          end
        end
      end
      configSets do
        provision [
          "do_provision"
        ]
        default [
          "default"
        ]
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

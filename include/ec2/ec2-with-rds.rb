EC2 do
  Type "AWS::EC2::Instance"
  DependsOn "AttachGatewayToVPC"
  Metadata do
    AWS__CloudFormation__Init do
      config do
        services do
          sysvinit do
            mysql do
                enabled false
                ensureRunning false
            end
          end
        end
        files do
		  _include "include/ec2/metadata-for-rds.rb"
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

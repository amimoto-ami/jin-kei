EC2 do
  Type "AWS::EC2::Instance"
  Metadata do
    AWS__CloudFormation__Init do
      config do
        files do
		  _include "include/ec2/metadata-for-aurora.rb"
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

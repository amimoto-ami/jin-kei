EC2 do
  Type "AWS::EC2::Instance"
  Metadata do
    AWS__CloudFormation__Init do
      config do
        files do
          _path("/opt/aws/cf_option.json") do
              content '{
                "option" : {
                  "cloudfront" : "true",
                  "woo": "true"
                }
              }'
            mode "00644"
            owner "root"
            group "root"
          end
		  _include "include/ec2/metadata-for-rds.rb"
        end
      end
    end
  end
  Properties do
  	_include "include/ec2/default-prop.rb"
    UserData do
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
            "\n"
          ]
        ]
      end
    end
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

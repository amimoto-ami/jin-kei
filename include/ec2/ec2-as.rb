EC2 do
  Type "AWS::EC2::Instance"
  Metadata do
    AWS__CloudFormation__Init do
      config do
        files do
          _path("/opt/local/init-codedeploy.sh") do
            source "https://s3-ap-northeast-1.amazonaws.com/cfn-jinkei-templates/init-codedeploy.sh"
          end
          _path("/opt/aws/cf_option.json") do
              content '{
                "option" : {
                  "cloudfront" : "true"
				},
				"autoscale" : "true"
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
            "\n",
            "/bin/bash -x /opt/local/init-codedeploy.sh",
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
        Key "HasRDS?"
        Value "true"
	  },
	  _{
	    Key "AmimotoDeploy"
	    Value do
	      Ref "AWS::StackName"
	    end
      }
    ]
  end
end

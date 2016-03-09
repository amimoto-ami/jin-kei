AutoScaleSetting do
  Type "AWS::AutoScaling::LaunchConfiguration"
  Properties do
    IamInstanceProfile do
      Ref "IAMForEC2"
    end
    ImageId do
      Fn__FindInMap [
        "MPAmimotov4",
        _{ Ref "AWS::Region" },
        "AMI"
      ]
    end
    InstanceType {
      Ref "InstanceType"
    }
    KeyName {
      Ref "KeyName"
    }
    SecurityGroups [
      _{
        Ref "SecurityGroupInstance"
      },
      _{
        Ref "SecurityGroupInternal"
      }
    ]
    UserData do
      Fn__Base64 do
        Fn__Join [
          "",
          [
            "#!/bin/bash\n",
            "curl -L https://s3-ap-northeast-1.amazonaws.com/cfn-jinkei-templates/init-codedeploy.sh | /bin/bash",
            "\n"
          ]
        ]
      end
    end
  end
end

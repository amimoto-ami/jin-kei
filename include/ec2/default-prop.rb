    AvailabilityZone do
      Ref "AvailabilityZone"
    end
    DisableApiTermination "false"
    EbsOptimized "false"
    ImageId do
      Fn__FindInMap [
        "MPAmimotov4",
        _{ Ref "AWS::Region" },
        "AMI"
      ]
    end
    InstanceInitiatedShutdownBehavior "stop"
    InstanceType {
      Ref "InstanceType"
    }
    KeyName {
      Ref "KeyName"
    }
    Monitoring "false"
    SubnetId do
      Ref "PublicSubnet"
    end
    Tenancy "default"
    SecurityGroupIds [
      _{
        Ref "SecurityGroupInstance"
      },
      _{
        Ref "SecurityGroupInternal"
      }
    ]
    IamInstanceProfile do
      Ref "IAMForEC2"
    end
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

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
    BlockDeviceMappings [
        _{
            DeviceName "/dev/sdb"
            VirtualName "ephemeral0"
        },
        _{
            DeviceName "/dev/sdc"
            VirtualName "ephemeral1"
        }#,
        #@TODO 設定がマネージドと違うらしく、エラーになる。
        #      起動するのを確認してからコミットする
        #_{
        #    DeviceName "/dev/xvda"
        #    Ebs do
        #        VolumeSize do
        #            Ref "EBSVolSize"
        #        end
        #    end
        #}
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
            "\n",
            "until find /var/www/vhosts -name wp-config.php  ; do sleep 5 ; done", "\n",
            "/opt/aws/bin/cfn-signal -e $? -r \"WordPress setup complete\" '",
            _{ Ref "EC2WaitHandle" }, "'\n"
          ]
        ]
      end
    end

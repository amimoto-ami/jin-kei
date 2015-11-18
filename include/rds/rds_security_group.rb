RDSSecurityGroup do
  Type "AWS::EC2::SecurityGroup"
  Properties do
    GroupDescription "This is Simple RDS SecurityGroup made by CloudFormation"
    SecurityGroupIngress [
      _{
        IpProtocol "tcp"
        FromPort   3306
        ToPort     3306
        SourceSecurityGroupId do
          Ref "SecurityGroup"
        end
      },
      _{
        IpProtocol "tcp"
        FromPort   3306
        ToPort     3306
        SourceSecurityGroupId do
          Ref "SecurityGroup"
        end
      }
    ]
    Tags [
      _{
        Key "Application"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
    VpcId do
      Ref "VPC"
    end
  end
end

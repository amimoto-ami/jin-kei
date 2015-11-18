SecurityGroup do
  Type "AWS::EC2::SecurityGroup"
  Properties do
    GroupDescription "This is Simple SecurityGroup made by CloudFormation"
    SecurityGroupIngress [
      _{
        IpProtocol "tcp"
        FromPort   22
        ToPort     22
        CidrIp do
          Ref "SSHLocation"
        end
      },
      _{
        IpProtocol "tcp"
        FromPort   80
        ToPort     80
        CidrIp     "0.0.0.0/0"
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

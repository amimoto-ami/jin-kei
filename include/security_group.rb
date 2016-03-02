SecurityGroupInstance do
  Type "AWS::EC2::SecurityGroup"
  Properties do
    GroupDescription "SG for EC2 Instance"
    SecurityGroupIngress [
      _{
        IpProtocol "tcp"
        FromPort   22
        ToPort     22
        CidrIp do
          Ref "SSHLocation"
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

SecurityGroupInternal do
  Type "AWS::EC2::SecurityGroup"
  Properties do
    GroupDescription "Allow connect between EC2 Instance and ELB"
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

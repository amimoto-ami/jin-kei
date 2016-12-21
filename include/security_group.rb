SecurityGroupPublic do
  Type "AWS::EC2::SecurityGroup"
  Properties do
    GroupDescription "SG for ELB"
    if $Stack_Type != 'autoscale' then
      SecurityGroupIngress [_{
        IpProtocol "tcp"
        FromPort   80
        ToPort     80
        CidrIp     "0.0.0.0/0"
      }]
    else
      SecurityGroupIngress [
        _{
          IpProtocol "tcp"
          FromPort   80
          ToPort     80
          CidrIp     "0.0.0.0/0"
        },
        _{
          IpProtocol "tcp"
          FromPort   22
          ToPort     22
          CidrIp do
            Ref "SSHLocation"
          end
        }
      ]
    end
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

SecurityGroupInternalSelfIngress80 do
  Type "AWS::EC2::SecurityGroupIngress"
  DependsOn "SecurityGroupInternal"
  Properties do
    GroupId do
      Ref "SecurityGroupInternal"
    end
    SourceSecurityGroupId do
      Ref "SecurityGroupInternal"
    end
    IpProtocol "tcp"
    ToPort     80
    FromPort   80
  end
end

SecurityGroupInternalSelfIngress443 do
  Type "AWS::EC2::SecurityGroupIngress"
  DependsOn "SecurityGroupInternal"
  Properties do
    GroupId do
      Ref "SecurityGroupInternal"
    end
    SourceSecurityGroupId do
      Ref "SecurityGroupInternal"
    end
    IpProtocol "tcp"
    ToPort     443
    FromPort   443
  end
end

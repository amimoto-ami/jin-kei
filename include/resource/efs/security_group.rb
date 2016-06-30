SecurityGroupFileSystem do
	Type "AWS::EC2::SecurityGroup"
	Properties do
      GroupDescription "SG for EFS"
      SecurityGroupIngress [
        _{
          IpProtocol "tcp"
          FromPort   2049
          ToPort     2049
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

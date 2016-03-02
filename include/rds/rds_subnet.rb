RDSSubnet1 do
  Type "AWS::EC2::Subnet"
  Properties do
    CidrBlock "10.0.1.0/24"
    AvailabilityZone do
      Ref "AvailabilityZonePrimary"
    end
    MapPublicIpOnLaunch "false"
    VpcId do
      Ref "VPC"
    end
    Tags [
      _{
        Key "Name"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
  end
end

RDSSubnet2 do
  Type "AWS::EC2::Subnet"
  Properties do
    CidrBlock "10.0.2.0/24"
    AvailabilityZone do
      Ref "AvailabilityZoneSecondary"
    end
    MapPublicIpOnLaunch "false"
    VpcId do
      Ref "VPC"
    end
    Tags [
      _{
        Key "Name"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
  end
end

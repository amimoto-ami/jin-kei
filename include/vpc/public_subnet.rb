PublicSubnet do
  Type "AWS::EC2::Subnet"
  DeletionPolicy "Retain"
  Properties do
    CidrBlock "10.0.0.0/24"
    AvailabilityZone do
      Fn__FindInMap [
        "AZs",
        _{ Ref "AWS::Region"},
        "PRI"
      ]
    end
    MapPublicIpOnLaunch "true"
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

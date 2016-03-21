RouteTable do
  Type "AWS::EC2::RouteTable"
  Properties do
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

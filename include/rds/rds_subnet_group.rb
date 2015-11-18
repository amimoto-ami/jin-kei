DBSubnetGroup do
  Type "AWS::RDS::DBSubnetGroup"
  Properties do
    DBSubnetGroupDescription "Subnets available for the RDS DB Instance"
    SubnetIds [
      _{
        Ref "RDSSubnet1"
      },
      _{
        Ref "RDSSubnet2"
      }
    ]
  end
end

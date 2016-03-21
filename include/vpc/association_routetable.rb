AssociationRtToPubSub do
  Type "AWS::EC2::SubnetRouteTableAssociation"
  Properties do
    RouteTableId do
      Ref "RouteTable"
    end
    SubnetId do
      Ref "PublicSubnet"
    end
  end
end

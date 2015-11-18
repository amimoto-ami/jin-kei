AssociationRtToPubSub do
  Type "AWS::EC2::SubnetRouteTableAssociation"
  DeletionPolicy "Retain"
  Properties do
    RouteTableId do
      Ref "RouteTable"
    end
    SubnetId do
      Ref "PublicSubnet"
    end
  end
end

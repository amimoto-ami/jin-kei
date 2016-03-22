#WordPress powered by JINKEI

##Relase Note
###Version1.0.1
- Update SecurityGroupIngress Setting
- Add Depends on "AttachGatewayToVPC"
 - AWS::ElasticLoadBalancing::LoadBalancer
 - AWS::RDS::DBSubnetGroup
- Remove DeletionPolicy
 - AWS::EC2::Subnet
 - AWS::EC2::RouteTable
 - AWS::EC2::SubnetRouteTableAssociation
 - AWS::EC2::InternetGateway
 - AWS::EC2::VPCGatewayAttachment
 - AWS::EC2::Route
 - AWS::EC2::VPC

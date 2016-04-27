#WordPress powered by JINKEI
CloudFormation templates to create WordPress stack using AMIMOTO-AMI.

##Getting Start
You can use 2way.

+ Using on AWS Market Place
+ Using kumogata

##Using on AWS Market Place
Search "AMIMOTO" on AWS Market Place.  
More information -> https://speakerdeck.com/amimoto/how-to-use-jin-kei-aws-cloudformation-template  
Japanese -> https://speakerdeck.com/amimoto/ri-ben-yu-jin-kei-aws-cloudformation-tenpuretofalseshi-ifang

##Using kumogata( How to contribute )
Clone this repository.
```
$ git@github.com:megumiteam/amimoto-enterprise-cfn.git
$ bundle install
```

Set up "kumogata"
```
$ gem install kumogata
```

You can use kumogata commands.
http://kumogata.codenize.tools/

If you want to validate all templates.
```
$ /bin/bash validate.sh
```

If you want to convert all templates to JSON.
```
$ /bin/bash deploy.sh
```

If you want to make stack using kumogata
```
$ kumogata create \
 001-woo.rb {STACK_NAME} \
 -s {AWS_SECRET_KEY} -k {AWS_ACCESS_KEY} \
 -r  {REGION} \
 -p "KeyName={KEY_NAME},MySQLPassword={DBPASSWORD},MulitiAZDatabase={true / false},SSHLocation={SSH_LOCATION},SecondaryAvailabilityZone={SECONDARY_AZ},AvailabilityZone={PRIMARY_AZ}" \
  --capabilities=CAPABILITY_IAM
```

##Stack Information
###ID:001 "Simple Stack"
####Architecture
![](./img/stack001.png)

####Template List

|Template Name|Based AMI|Market Place|Template URL|JSON URL|
|:--|:--|:--|:--|:--|:--|
|WordPress powered by JINKEI (Simple Stack HVM) |[WordPress powered by AMIMOTO (HVM)](https://aws.amazon.com/marketplace/pp/B00LWHVJH8/)|https://aws.amazon.com/marketplace/pp/B00LWHVJH8/|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/001.rb|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/json/001.json|
|WordPress powered by JINKEI (Simple Stack HVM with **Amazon Aurora**)|[WordPress powered by AMIMOTO (HVM)](https://aws.amazon.com/marketplace/pp/B00LWHVJH8/)|Now Reviewing|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/001-hvm-aurora.rb|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/json/001-hvm-aurora.json|
|WordPress powered by JINKEI (Simple Stack HHVM) |[WordPress Powered by AMIMOTO (HHVM)](https://aws.amazon.com/marketplace/pp/B00V5JYXTO/)|https://aws.amazon.com/marketplace/pp/B00V5JYXTO/|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/001-hhvm.rb|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/json/001-hhvm.json|
|WordPress powered by JINKEI (Simple Stack HHVM with **Amazon Aurora**) |[WordPress Powered by AMIMOTO (HHVM)](https://aws.amazon.com/marketplace/pp/B00V5JYXTO/)|Now Reviewing|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/001-hhvm-aurora.rb|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/json/001-hhvm-aurora.json|
|WordPress powered by JINKEI (Simple Stack Mod_PHP7) |[WordPress Powered by AMIMOTO (Apache HTTPD PHP7)](https://aws.amazon.com/marketplace/pp/B01B3ZE1NC/)|https://aws.amazon.com/marketplace/pp/B01B3ZE1NC/|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/001-mod.rb|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/json/001-mod.json|
|WordPress powered by JINKEI (Simple Stack Mod_PHP7 with **Amazon Aurora**) |[WordPress Powered by AMIMOTO (Apache HTTPD PHP7)](https://aws.amazon.com/marketplace/pp/B01B3ZE1NC/)|Now Reviewing|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/001-mod-aurora.rb|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/json/001-mod-aurora.json|
|WooCommerce powered by JINKEI (Simple Stack HHVM) |[WooCommerce Powered by AMIMOTO (HHVM)](https://aws.amazon.com/marketplace/pp/B00ZGTRMVU/)|https://aws.amazon.com/marketplace/pp/B00ZGTRMVU/|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/001-woo.rb|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/json/001-woo.json|
|WooCommerce powered by JINKEI (Simple Stack HHVM with **Amazon Aurora**) |[WooCommerce Powered by AMIMOTO (HHVM)](https://aws.amazon.com/marketplace/pp/B00ZGTRMVU/)|Now Reviewing|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/001-woo-aurora.rb|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/json/001-woo-aurora.json|
|WooCommerce powered by JINKEI (Simple Stack HVM) |[WooCommerce Powered by AMIMOTO (HVM)](https://aws.amazon.com/marketplace/pp/B01DCGKFMQ/)|Now Reviewing|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/001-woo-hvm.rb|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/json/001-woo-hvm.json|
|WooCommerce powered by JINKEI (Simple Stack Mod_PHP7) |[WooCommerce Powered by AMIMOTO (Apache HTTPD PHP7)](https://aws.amazon.com/marketplace/pp/B01DAONMCK/)|Now Reviewing|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/001-woo-mod.rb|https://github.com/megumiteam/amimoto-enterprise-cfn/blob/master/json/001-woo-mod.json|


##Relase Note
###Version1.2.1
- Auto Set-up nephila clavata Plugin

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

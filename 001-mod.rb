AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Powerful & Scalable AMIMOTO Stack made by CloudFormation.
  Added RDS, Database change more scalable.
  Use service is VPC,EC2,EIP,CloudFront,S3,RDS(MariaDB).
EOS

Mappings do
  _include "include/mapping/ami_mod.rb"
  _include "include/mapping/az.rb"
end

Parameters do
  _include "params/keyname.rb"
  _include "params/ssh_location.rb"
  _include "params/ec2_instance.rb"
  _include "params/rds_settings.rb"
end

Resources do
  _include 'include/vpc/vpc.rb'
  _include "include/ec2/ec2-for-woo.rb"
  _include "include/rds/rds.rb"
  _include "include/security_group.rb"
  _include "include/elb.rb"
  _include 'include/iam/for_stack_001.rb'
  _include "include/cloudfront/cf.rb"
  _include "include/s3/s3-media.rb"
end

Outputs do
  _include "outputs/ec2.rb"
  _include "outputs/cloudfront.rb"
  _include "outputs/s3.rb"
end

Parameters do
  _include "params/keyname.rb"
  _include "params/ssh_location.rb"
  _include "params/subnets.rb"
  _include "params/ec2_instance.rb"
  _include "params/rds_settings.rb"
end

Resources do
  _include 'include/vpc/vpc.rb'
  _include 'include/ec2/waithandle_ec2.rb'
  _include "include/ec2/ec2-with-aurora.rb"
  _include "include/rds_aurora/aurora.rb"
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

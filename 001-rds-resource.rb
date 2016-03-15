Resources do
  _include 'include/vpc/vpc.rb'
  _include 'include/ec2/waithandle_ec2.rb'
  _include "include/ec2/ec2-with-rds.rb"
  _include "include/rds/rds.rb"
  _include "include/security_group.rb"
  _include "include/elb.rb"
  _include 'include/iam/for_stack_001.rb'
  _include "include/cloudfront/cf.rb"
  _include "include/s3/s3-media.rb"
end
_include 'include/vpc/vpc.rb'
if $Stack_Type != 'autoscale' then
  _include 'include/ec2/waithandle_ec2.rb'
end
_include "include/security_group.rb"
_include "include/elb.rb"
_include 'include/iam/for_stack_001.rb'
_include "include/cloudfront/cf.rb"
_include "include/s3/s3-media.rb"

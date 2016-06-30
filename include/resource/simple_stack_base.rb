Resources do
  _include "include/resource/ec2/ec2.rb"
  if $DB_TYPE == 'rds' then
    _include "include/rds/rds.rb"
  elsif $DB_TYPE == 'aurora' then
    _include "include/rds_aurora/aurora.rb"
  end
  _include 'include/vpc/vpc.rb'
  _include 'include/ec2/waithandle_ec2.rb'
  _include "include/security_group.rb"
  _include "include/elb.rb"
  _include 'include/iam/for_stack_001.rb'
  _include "include/cloudfront/cf.rb"
  _include "include/s3/s3-media.rb"
end

$Stack_Type = 'autoscale'

AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  WordPress powered by JINKEI (AutoScaling HVM) Version1.0.0
  Supported AutoScaling, it is really Powerful & Scalable AMIMOTO Stack made by CloudFormation.
  Use service is VPC,EC2,EIP,CloudFront,S3,RDS(MariaDB),EFS,AutoScale,CloudWatch.
EOS

Metadata do
  _include "metadata/autoscale_rds.rb"
end

Mappings do
  _include "include/mapping/ami_as.rb"
end

Parameters do
  _include "params/001-base-param.rb"
  _include "params/ec2_instance.rb"
  _include "params/rds_settings.rb"
  _include "include/parameters/domain.rb"
  _include "include/parameters/wordpress.rb"
  _include "include/parameters/autoscale.rb"
  _include "include/parameters/cloudwatchlogs.rb"
end

_include "include/resource/resource_efs.rb"
_include "outputs/001-base-output.rb"

$DB_TYPE = 'rds'

AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  WordPress powered by JINKEI (Simple Stack For Woo HHVM ) Version1.3.0
  This is Powerful & Scalable AMIMOTO Stack made by CloudFormation.
  Added RDS, Database change more scalable.
  Use service is VPC,EC2,EIP,CloudFront,S3,RDS(MariaDB).
EOS

Mappings do
  _include "include/mapping/ami_woo_hhvm.rb"
end

Parameters do
  _include "params/001-base-param.rb"
  _include "params/ec2_instance_hhvm.rb"
  _include "params/rds_settings.rb"
end
_include "include/resource/simple_stack_base.rb"
_include "outputs/001-base-output.rb"

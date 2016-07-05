$Stack_Type = 'autoscale'

AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  WordPress powered by JINKEI (Simple Stack HVM) Version1.3.0
  This is Powerful & Scalable AMIMOTO Stack made by CloudFormation.
  Added RDS, Database change more scalable.
  Use service is VPC,EC2,EIP,CloudFront,S3,RDS(MariaDB).
EOS

Mappings do
  _include "include/mapping/ami_hvm.rb"
end

Parameters do
  _include "params/001-base-param.rb"
  _include "params/ec2_instance.rb"
  _include "params/rds_settings.rb"
  _include "include/parameters/domain.rb"
  _include "include/parameters/wordpress.rb"
end

_include "include/resource/resource_efs.rb"
_include "outputs/001-base-output.rb"
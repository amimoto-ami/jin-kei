AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Powerful & Scalable AMIMOTO Stack made by CloudFormation.
  Added RDS, Database change more scalable.
  Use service is VPC,EC2,EIP,CloudFront,S3,RDS(Amazon Aurora).
EOS

Mappings do
  _include "include/mapping/ami_woo.rb"
end

Conditions do
  CreateSecDB do
    Fn__Equals [
      _{ Ref "MulitiAZDatabase" },
      true
    ]
  end
end

Parameters do
  _include "001-base-param.rb"
  _include "params/ec2_instance_hhvm.rb"
  _include "params/aurora_settings.rb"
end
_include "001-aurora-resource.rb"
_include "001-base-output.rb"

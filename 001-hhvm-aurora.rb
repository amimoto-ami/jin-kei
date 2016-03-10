AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Powerful & Scalable AMIMOTO Stack made by CloudFormation.
  Added RDS, Database change more scalable.
  Use service is VPC,EC2,EIP,CloudFront,S3,RDS(Amazon Aurora).
EOS

Mappings do
  _include "include/mapping/ami_hhvm.rb"
end

Conditions do
  CreateSecDB do
    Fn__Equals [
      _{ Ref "MulitiAZDatabase" },
      true
    ]
  end
end

_include "001-base-aurora.rb"

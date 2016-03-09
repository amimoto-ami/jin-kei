_include "include/iam/policies/allow-invalidation.rb"
_include "include/iam/policies/s3-for-autoscale.rb"

IAMRoleForStack002 do
  Type "AWS::IAM::Role"
  DependsOn [
    "IAMPolicyForCloudFront",
    "IAMPolicyForS3AS"
  ]
  Properties do
    ManagedPolicyArns [
      _{ Ref "IAMPolicyForCloudFront" },
      _{ Ref "IAMPolicyForS3AS" }
    ]
    AssumeRolePolicyDocument do
      Version "2012-10-17"
      Statement do
        Effect "Allow"
        Principal do
          Service "ec2.amazonaws.com"
        end
        Action [
          "sts:AssumeRole"
        ]
      end
    end
    Path "/"
  end
end

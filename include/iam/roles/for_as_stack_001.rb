_include "include/iam/policies/allow-invalidation.rb"
_include "include/iam/policies/codedeploy.rb"
_include "include/iam/policies/s3-bucket.rb"

IAMRoleForStack001 do
  Type "AWS::IAM::Role"
  DependsOn [
    "IAMPolicyForCloudFront",
    "IAMPolicyForS3Media"
  ]
  Properties do
    ManagedPolicyArns [
      _{ Ref "IAMPolicyForCloudFront" },
      _{ Ref "IAMPolicyForS3Media" },
      _{ Ref "IAMRoleForCodeDeploy" }
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

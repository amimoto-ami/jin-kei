_include "include/iam/policies/codedeploy.rb"

IAMRoleForCodeDeploy do
  Type "AWS::IAM::Role"
  DependsOn [
    "IAMPolicyForCodeDeploy"
  ]
  Properties do
    ManagedPolicyArns [
      _{ Ref "IAMPolicyForCodeDeploy" }
    ]
    AssumeRolePolicyDocument do
      Version "2012-10-17"
      Statement do
        Effect "Allow"
        Principal do
          Service "codedeploy.amazonaws.com"
        end
        Action [
          "sts:AssumeRole"
        ]
      end
    end
    Path "/"
  end
end

_include 'include/iam/roles/autoscale.rb'

IAMForEC2 do
  Type "AWS::IAM::InstanceProfile"
  Properties do
    Path  "/"
    Roles [
      _{
        Ref "IAMRoleForInstance"
      }
    ]
  end
end

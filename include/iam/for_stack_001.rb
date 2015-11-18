_include 'include/iam/roles/for_stack_001.rb'

IAMForEC2 do
  Type "AWS::IAM::InstanceProfile"
  Properties do
    Path  "/"
    Roles [
      _{
        Ref "IAMRoleForStack001"
      }
    ]
  end
end

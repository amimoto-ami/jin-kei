_include 'include/iam/roles/for_stack_002.rb'

IAMForEC2 do
  Type "AWS::IAM::InstanceProfile"
  Properties do
    Path  "/"
    Roles [
      _{
        Ref "IAMRoleForStack002"
      }
    ]
  end
end

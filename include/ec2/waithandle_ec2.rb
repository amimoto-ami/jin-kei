EC2WaitHandle do
  Type "AWS::CloudFormation::WaitConditionHandle"
end

EC2WaitCondition do
  Type "AWS::CloudFormation::WaitCondition"
  DependsOn "EC2"
  Properties do
    Handle do
      Ref "EC2WaitHandle"
    end
    Timeout "1800"
  end
end

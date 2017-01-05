IAMPolicyForSSM do
  Type "AWS::IAM::ManagedPolicy"
  Properties do
    Description "Allow EC2 System Manager"
    PolicyDocument do
      Version "2012-10-17"
      Statement [
        _{
          Effect "Allow"
          Action [
            "ssm:*",
            "ec2messages:*"
          ]
          Resource "*"
        }
      ]
    end
  end
end

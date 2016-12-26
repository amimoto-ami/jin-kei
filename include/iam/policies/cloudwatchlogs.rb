IAMPolicyForCWL do
  Type "AWS::IAM::ManagedPolicy"
  Properties do
    Description "CloudWatch Logs"
    PolicyDocument do
      Version "2012-10-17"
      Statement [
                    _{
                      Effect "Allow"
                      Action [
                          "logs:Create*",
                          "logs:PutLogEvents",
                          "s3:GetObject"
                      ]
                      Resource [
                          "arn:aws:logs:*:*:*",
                          "arn:aws:s3:::*"
                      ]
                    }
                ]
    end
  end
end

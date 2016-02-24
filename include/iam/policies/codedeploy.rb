IAMPolicyForCodeDeploy do
  Type "AWS::IAM::ManagedPolicy"
  Properties do
    Description "Allow Code Deploy"
    PolicyDocument do
      Version "2012-10-17"
      Statement [
        _{
          ## See This page
          ## https://docs.aws.amazon.com/ja_jp/codedeploy/latest/userguide/getting-started-walkthrough.html
          Effect "Allow"
          Action [
            "ec2:*",
			"autoscaling:*"
          ]
          Resource "*"
        }
      ]
    end
  end
end

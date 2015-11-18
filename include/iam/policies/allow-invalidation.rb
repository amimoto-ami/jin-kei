IAMPolicyForCloudFront do
  Type "AWS::IAM::ManagedPolicy"
  Properties do
    Description "Allow invalidation"
    PolicyDocument do
      Version "2012-10-17"
      Statement [
        _{
          ## Invalidationの参照と登録のみを許可
          Effect "Allow"
          Action [
            "cloudfront:*Invalidation*"
          ]
          Resource "*"
        }
      ]
    end
  end
end

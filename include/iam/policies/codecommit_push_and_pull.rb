IAMPolicyForCodeCommit do
  Type "AWS::IAM::ManagedPolicy"
  Properties do
    Description "Allow Push and Pull"
    PolicyDocument do
      Version "2012-10-17"
      Statement [
        _{
          ## Push/Pull、ブランチ系の操作のみ可能
          Effect "Allow"
          Action [
            "codecommit:BatchGetRepositories",
            "codecommit:Get*",
            "codecommit:GitPull",
            "codecommit:GitPush",
            "codecommit:ListBranches"
          ]
          Resource do
            Ref "CodeCommitARN"
          end
        }
      ]
    end
  end
end

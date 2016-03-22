CodeCommitARN do
  Description "Your Codecommit ARN (Caution: It will be override by wordpress.)"
  Type        "String"
  AllowedPattern "arn:aws:codecommit:.*"
  ConstraintDescription "must be an CodeCommit Repository ARN"
end

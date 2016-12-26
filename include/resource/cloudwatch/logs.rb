CWLogs do
  Type "AWS::Logs::LogGroup"
  Properties do
    RetentionInDays do
      Ref "LogRetentionInDays"
    end
  end
end
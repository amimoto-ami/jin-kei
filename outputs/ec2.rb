EC2InstanceId do
  Description "Instance ID required for first login. Please make a note of this value."
  Value do
    Ref "EC2"
  end
end

AvailabilityZone do
  Description "Pick an AvailabilityZone for the Primary Subnet. Public subnet will be created in here."
  Type "AWS::EC2::AvailabilityZone::Name"
end

SecondaryAvailabilityZone do
  Description "Pick an AvailabilityZone for the RDS database."
  Type "AWS::EC2::AvailabilityZone::Name"
end

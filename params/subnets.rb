AvailabilityZone do
  Description "Pick an AvailabilityZone for the Primary Subnet. The public subnet will be created in this zone."
  Type "AWS::EC2::AvailabilityZone::Name"
end

SecondaryAvailabilityZone do
  Description "Pick an AvailabilityZone for the RDS database."
  Type "AWS::EC2::AvailabilityZone::Name"
end

AvailabilityZone do
  Description "Pick an AvailabilityZone for Primary Subnet. Public subnet will creates in here."
  Type "AWS::EC2::AvailabilityZone::Name"
end

SecondaryAvailabilityZone do
  Description "Pick an AvailabilityZone for Secondary Subnet.This zone is used by RDS."
  Type "AWS::EC2::AvailabilityZone::Name"
end

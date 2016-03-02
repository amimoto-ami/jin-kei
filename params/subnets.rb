AvailabilityZonePrimary do
  Description "Pick an AvailabilityZone for Primary Subnet. Public subnet will creates in here."
  Type "AWS::EC2::AvailabilityZone::Name"
end

AvailabilityZoneSecondary do
  Description "Pick an AvailabilityZone for Secondary Subnet."
  Type "AWS::EC2::AvailabilityZone::Name"
end

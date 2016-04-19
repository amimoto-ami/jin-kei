SSHLocation do
  Description "The IP address range that can be used to SSH to the EC2 instances"
  Type "String"
  MinLength 9
  MaxLength 18
  AllowedPattern "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})"
  ConstraintDescription "Must be a valid IP CIDR range of the form x.x.x.x/x."
end


KeyName do
  Description "Name of an existing EC2 key pair to enable SSH access to the instances"
  Type "AWS::EC2::KeyPair::KeyName"
  ConstraintDescription "Must be the name of an existing EC2 KeyPair."
end

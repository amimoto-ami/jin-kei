InstanceType do
  Description "EC2 instance type"
  Type "String"
  Default "c3.large"
  AllowedValues "m3.medium",
				"m3.large",
				"m3.xlarge",
				"m3.2xlarge",
				"m4.large",
				"m4.xlarge",
				"m4.2xlarge",
				"m4.4xlarge",
				"m4.10xlarge",
				"c3.large",
				"c3.xlarge",
				"c3.2xlarge",
				"c3.4xlarge",
				"c3.8xlarge",
				"c4.large",
				"c4.xlarge",
				"c4.2xlarge",
				"c4.4xlarge",
				"c4.8xlarge",
				"g2.2xlarge",
				"hi1.4xlarge",
				"hs1.8xlarge",
				"i2.xlarge",
				"i2.2xlarge",
				"i2.4xlarge",
				"i2.8xlarge",
				"r3.large",
				"r3.xlarge",
				"r3.2xlarge",
				"r3.4xlarge",
				"r3.8xlarge"
  ConstraintDescription "Must be a valid EC2 instance type."
end
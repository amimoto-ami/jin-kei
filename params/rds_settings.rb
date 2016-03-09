MySQLPassword do
  Description "Password of RDS User"
  Type        "String"
  MinLength   8
  MaxLength   64
  NoEcho      true
end

MulitiAZDatabase do
  Description           "Crate a Multi-AZ RDS Database Instance"
  Default               false
  Type                  "String"
  AllowedValues         "true","false"
  ConstraintDescription "must be either true or false"
end

RDSInstanceType do
  Description           "RDS Instance Type"
  Default               "db.t2.medium"
  Type                  "String"
  AllowedValues         "db.t2.micro",
				"db.t2.small",
				"db.t2.medium",
				"db.m1.small",
				"db.m1.medium",
				"db.m1.large",
				"db.m1.xlarge",
				"db.m3.medium",
				"db.m3.large",
				"db.m3.xlarge",
				"db.m3.2xlarge",
				"db.m2.xlarge",
				"db.m2.2xlarge",
				"db.m2.4xlarge",
				"db.r3.large",
				"db.r3.xlarge",
				"db.r3.2xlarge",
				"db.r3.4xlarge",
				"db.r3.8xlarge"
  ConstraintDescription "Must be a valid RDS Instance Type."
end

DBAllocatedStorage do
  Default               20
  Description           "The size of the database (Gb)"
  Type                  "Number"
  MinValue              5
  MaxValue              3072
  ConstraintDescription "must be between 5 and 3072Gb."
end

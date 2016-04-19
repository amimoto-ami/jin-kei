MySQLPassword do
  Description "Password for the RDS User"
  Type        "String"
  MinLength   8
  MaxLength   64
  NoEcho      true
end

MulitiAZDatabase do
  Description           "Create a Multi-AZ RDS Database Instance"
  Default               true
  Type                  "String"
  AllowedValues         "true","false"
  ConstraintDescription "Must be either true or false"
end

RDSInstanceType do
  Description           "Aurora RDS Instance Type"
  Default               "db.r3.large"
  Type                  "String"
  AllowedValues         "db.r3.large", "db.r3.xlarge", "db.r3.2xlarge", "db.r3.4xlarge", "db.r3.8xlarge"
  ConstraintDescription "Must be a valid RDS Instance Type."
end

DBAllocatedStorage do
  Default               20
  Description           "The size of the database (Gb)"
  Type                  "Number"
  MinValue              5
  MaxValue              3072
  ConstraintDescription "Must be between 5 and 3072Gb."
end

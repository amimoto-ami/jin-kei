EBSVolSize do
  Description "EBS Storage Type"
  Type "String"
  AllowedValues "30",
				"200",
				"300",
				"400",
				"500",
				"1000"
  ConstraintDescription "Must be a valid EBS volume size."
end

_include 'include/rds/rds_subnet.rb'
_include 'include/rds/rds_subnet_group.rb'
_include 'include/rds/rds_security_group.rb'
_include 'include/rds_aurora/aurora_cluster.rb'

RDSA do
  Type "AWS::RDS::DBInstance"
  Properties do
    Engine "aurora"
    DBClusterIdentifier do
      Ref "RDSCluster"
    end
    AllowMajorVersionUpgrade true
    AutoMinorVersionUpgrade true
    AvailabilityZone do
      Ref "AvailabilityZone"
    end
    DBSubnetGroupName do
      Ref "DBSubnetGroup"
    end
    DBInstanceClass do
      Ref "RDSInstanceType"
    end
    Tags [
      _{
        Key "Application"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
  end
end

RDSB do
  Type "AWS::RDS::DBInstance"
  Condition "CreateSecDB"
  Properties do
    Engine "aurora"
    DBClusterIdentifier do
      Ref "RDSCluster"
    end
    AllowMajorVersionUpgrade true
    AutoMinorVersionUpgrade true
    AvailabilityZone do
      Ref "SecondaryAvailabilityZone"
    end
    DBSubnetGroupName do
      Ref "DBSubnetGroup"
    end
    DBInstanceClass do
      Ref "RDSInstanceType"
    end
    Tags [
      _{
        Key "Application"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
  end
end

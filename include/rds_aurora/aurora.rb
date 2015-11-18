_include 'include/rds/rds_subnet.rb'
_include 'include/rds/rds_subnet_group.rb'
_include 'include/rds/rds_security_group.rb'
_include 'include/rds_aurora/aurora_cluster.rb'

RDS do
  Type "AWS::RDS::DBInstance"
  Properties do
    DBClusterIdentifier do
      Ref "RDSCluster"
    end
    AllowMajorVersionUpgrade true
    AutoMinorVersionUpgrade true
    AvailabilityZone do
      Fn__FindInMap [
        "AZs",
        _{ Ref "AWS::Region"},
        "PRI"
      ]
    end
    DBInstanceClass do
      Ref "RDSInstanceType"
    end
    DBSubnetGroupName do
      Ref "DBSubnetGroup"
    end
    Engine "aurora"
    MultiAZ do
      Ref "MulitiAZDatabase"
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

#"DBSnapshotIdentifier" : String,
#"Iops" : Number,

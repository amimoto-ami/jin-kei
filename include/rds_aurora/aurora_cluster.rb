RDSCluster do
  Type "AWS::RDS::DBCluster"
  Properties do
    Engine "aurora"
    DatabaseName          "wordpress"
    PreferredBackupWindow "00:00-00:30"
    PreferredMaintenanceWindow "sun:16:00-sun:17:30"
    AvailabilityZones [
      _{ Ref "AvailabilityZone" },
      _{ Ref "SecondaryAvailabilityZone" }
    ]
    BackupRetentionPeriod 1
    DBSubnetGroupName do
      Ref "DBSubnetGroup"
    end
    MasterUsername "amimoto"
    MasterUserPassword do
      Ref "MySQLPassword"
    end
    Port 3306
    VpcSecurityGroupIds [
      _{
        Ref "RDSSecurityGroup"
      }
    ]
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

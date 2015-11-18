RDSCluster do
  Type "AWS::RDS::DBCluster"
  Properties do
    BackupRetentionPeriod 1
    DatabaseName          "wordpress"
    DBSubnetGroupName do
      Ref "DBSubnetGroup"
    end
    Engine "aurora"
    MasterUsername "amimoto"
    MasterUserPassword do
      Ref "MySQLPassword"
    end
    Port 3306
    PreferredBackupWindow "00:00-00:30"
    PreferredMaintenanceWindow "sun:16:00-sun:17:30"
    Tags [
      _{
        Key "Application"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
    VpcSecurityGroupIds [
      _{
        Ref "RDSSecurityGroup"
      }
    ]

  end
end

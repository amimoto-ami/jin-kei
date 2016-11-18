AWS__CloudFormation__Interface do
    ParameterGroups [
        _{
            Label do
                default "Select Locations"
            end
            Parameters "AvailabilityZone", "SecondaryAvailabilityZone"
        },_{
            Label do
                default "Amazon EC2 Configuration"
            end
            Parameters "InstanceType", "KeyName", "SSHLocation"
        },_{
            Label do
                default "EC2 AutoScaling Configuration"
            end
            Parameters "AutoScalingMinSize", "AutoScalingMaxSize", "AutoScalingDesiredCapacity"
        },_{
            Label do
                default "WordPress Configuration"
            end
            Parameters "WebSiteDomain", "WPUserEmail", "WPUserName", "WPPassword"
        },_{
            Label do
                default "Amazon RDS Configuration"
            end
            Parameters "RDSInstanceType", "MySQLPassword", "MulitiAZDatabase", "DBAllocatedStorage"
        },
    ]
    ParameterLabels do
        VPCID do
            default "Which VPC should this be deployed to?"
        end
    end
end

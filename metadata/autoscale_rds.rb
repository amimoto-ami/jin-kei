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
            Parameters "WebSiteDomain",  "WPUserName", "WPPassword", "WPUserEmail", "WPCoreVersion", "WPIsMultiSite", "IsMobileDetect"
        },_{
            Label do
                default "Amazon RDS Configuration"
            end
            Parameters "RDSInstanceType", "MySQLPassword", "MulitiAZDatabase", "DBAllocatedStorage"
        },_{
            Label do
                default "Extra Configuration"
            end
            Parameters "PHPmyAdmin", "PHPMemoryLimit", "NginxClientMaxBodySite", "LogRetentionInDays"
        }
    ]
    ParameterLabels do
        LogRetentionInDays do
            default "Log retention days (optional)"
        end
        WebSiteDomain do
            default "website domain"
        end
        WPUserEmail do
            default "Login Email address"
        end
        WPUserName do
            default "Login user name"
        end
        WPPassword do
            default "Login user password"
        end
        WPCoreVersion do
            default "WordPress version (optional)"
        end
        WPIsMultiSite do
            default "Multisite setting (optional)"
        end
        IsMobileDetect do
            default "is_wp_mobile() support (optional)"
        end
        PHPmyAdmin do
            default "phpMyAdmin setting (optional)"
        end
        NginxClientMaxBodySite do
            default "Nginx client_max_body_size setting (optional)"
        end
        PHPMemoryLimit do
            default "php memory limit setting (optional)"
        end
    end
end

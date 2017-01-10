WPPassword do
  Description "Password for the WordPress User"
  Type        "String"
  MinLength   8
  MaxLength   64
  NoEcho      true
end

WPUserEmail do
  Description "Email address for the WordPress User"
  Type        "String"
end

WPUserName do
  Description "User Name for the WordPress User"
  Type        "String"
end

WPCoreVersion do
  Description "WordPress Version"
  Type "String"
  Default "latest"
  AllowedValues "4.5.4", "4.6.1", "latest"
  ConstraintDescription "Must be a valid WordPress Version"
end

WPIsMultiSite do
    Description "Nginx config exchange for Multisite WordPress"
    Type "String"
    Default "disabled"
    AllowedValues "disabled", "enabled"
    ConstraintDescription "Must be a valid configuration"
end


IsMobileDetect do
    Description "If you use `is_wp_mobile()` function, please enable it."
    Type "String"
    Default "disabled"
    AllowedValues "disabled", "enabled"
    ConstraintDescription "Must be a valid configuration"
end

PHPmyAdmin do
    Description "Enable phpMyAdmin"
    Type "String"
    Default "disabled"
    AllowedValues "disabled", "enabled"
    ConstraintDescription "Must be a valid configuration"
end

NginxClientMaxBodySite do
  Description "Nginx Client max body size (MB)"
  Type "Number"
  Default 4
end

PHPMemoryLimit do
    Description "PHP memory limit (MB)"
    Type "Number"
    Default 128
end

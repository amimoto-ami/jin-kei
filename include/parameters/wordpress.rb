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

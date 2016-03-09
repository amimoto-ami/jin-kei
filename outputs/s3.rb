
S3MediaBucketURL do
  Description "This is S3 Bucket URL. Please set 'Nephila clavata' Plugin on admin page."
  Value do
    Fn__GetAtt "S3Media", "WebsiteURL"
  end
end

S3ASBucketURL do
  Description "This is S3 Bucket URL For Deploy Your WordPress Site. Please download it and uploading from CodeDeploy"
  Value do
    Fn__GetAtt "S3ForAS", "DomainName"
  end
end

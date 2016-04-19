
S3MediaBucketURL do
  Description "This is the S3 Bucket URL. Please set 'Nephila clavata' Plugin on admin page."
  Value do
    Fn__GetAtt "S3Media", "WebsiteURL"
  end
end

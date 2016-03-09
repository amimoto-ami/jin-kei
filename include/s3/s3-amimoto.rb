S3ForAS do
  Type "AWS::S3::Bucket"
  Properties do
  end
  ## テンプレート削除時にバケットは残す
  DeletionPolicy "Retain"
end

S3Media do
  Type "AWS::S3::Bucket"
  Properties do
    WebsiteConfiguration do
      IndexDocument "index.html"
    end
  end
  ## テンプレート削除時にバケットは残す
  DeletionPolicy "Retain"
end

##@TODO EC2アタッチ済みのロールに上記ロール追加

  WebSiteURL do
    Description "WordPress Site URL (Please wait a few minutes for the installation to complete before accessing.)"
    Value do
      Fn__Join [
        "",
        [
          "http://",
          _{
            Fn__GetAtt "CloudFront", "DomainName"
          }
        ]
      ]
    end
  end
  CloudFrontDistributionId do
    Description "This is the CloudFront Disctribution ID. Please set the 'C3 CloudFlont Cache Clear' plugin on admin page."
    Value do
      Ref "CloudFront"
    end
  end

CloudFront do
  Type "AWS::CloudFront::Distribution"
  Properties do
    DistributionConfig do
      Origins [
        _{
          DomainName do
            Fn__Join [
              "",
              [
                _{
                  Fn__GetAtt "ELB", "DNSName"
                }
              ]
            ]
          end
          Id do
            Ref "AWS::StackName"
          end
          CustomOriginConfig do
            HTTPPort "80"
            HTTPSPort "443"
            OriginProtocolPolicy "http-only"
          end
        }
      ]
      PriceClass "PriceClass_200"
      Enabled true
      Comment "Created by AMIMOTO CloudFormation."
      DefaultRootObject "index.php"
      DefaultCacheBehavior do
        SmoothStreaming false
        AllowedMethods [
          "HEAD",
          "DELETE",
          "POST",
          "GET",
          "OPTIONS",
          "PUT",
          "PATCH"
        ]
        CachedMethods [
          "HEAD",
          "GET"
        ]
        MinTTL "0"
        TargetOriginId do
          Ref "AWS::StackName"
        end
        ForwardedValues do
          QueryString true
          Headers [
            "CloudFront-Forwarded-Proto",
            "CloudFront-Is-Desktop-Viewer",
            "CloudFront-Is-Mobile-Viewer",
            "CloudFront-Is-Tablet-Viewer",
            "Host"
          ]
          Cookies do
            Forward "whitelist"
            WhitelistedNames [
              "wordpress_????????????????????????????????",
              "wordpress_logged_in_*"
            ]
          end
        end
        ViewerProtocolPolicy "allow-all"
      end
      ViewerCertificate do
        CloudFrontDefaultCertificate true
        MinimumProtocolVersion "SSLv3"
      end
      Restrictions do
        GeoRestriction do
          RestrictionType "none"
        end
      end
      CacheBehaviors [
        _{
          TargetOriginId do
            Ref "AWS::StackName"
          end
          ViewerProtocolPolicy "allow-all"
          ForwardedValues do
            Headers [
              "CloudFront-Forwarded-Proto",
              "CloudFront-Is-Desktop-Viewer",
              "CloudFront-Is-Mobile-Viewer",
              "CloudFront-Is-Tablet-Viewer",
              "Host",
              "User-Agent"
            ]
            Cookies do
              Forward "all"
            end
            QueryString true
          end
          PathPattern "*.php"
          SmoothStreaming false
          AllowedMethods [
            "HEAD",
            "DELETE",
            "POST",
            "GET",
            "OPTIONS",
            "PUT",
            "PATCH"
          ]
          CachedMethods [
              "HEAD",
              "GET"
          ]
          MinTTL "0"
        },
        _{
          TargetOriginId do
            Ref "AWS::StackName"
          end
          ViewerProtocolPolicy "allow-all"
          ForwardedValues do
            Headers [
              "Accept",
              "Authorization",
              "CloudFront-Forwarded-Proto",
              "CloudFront-Is-Desktop-Viewer",
              "CloudFront-Is-Mobile-Viewer",
              "CloudFront-Is-Tablet-Viewer",
              "Host",
              "User-Agent"
            ]
            Cookies do
              Forward "all"
            end
            QueryString true
          end
          PathPattern "/wp-admin/"
          SmoothStreaming false
          AllowedMethods [
            "HEAD",
            "DELETE",
            "POST",
            "GET",
            "OPTIONS",
            "PUT",
            "PATCH"
          ]
          CachedMethods [
              "HEAD",
              "GET"
          ]
          MinTTL "0"
        },
        _{
          TargetOriginId do
            Ref "AWS::StackName"
          end
          ViewerProtocolPolicy "allow-all"
          ForwardedValues do
            Headers [
              "Host"
            ]
            Cookies do
              Forward "none"
            end
            QueryString true
          end
          PathPattern "/wp-admin/uploads/*"
          SmoothStreaming false
          AllowedMethods [
            "HEAD",
            "GET"
          ]
          CachedMethods [
              "HEAD",
              "GET"
          ]
          MinTTL "43200"
        },
        _{
          TargetOriginId do
            Ref "AWS::StackName"
          end
          ViewerProtocolPolicy "allow-all"
          ForwardedValues do
            Headers [
              "Host"
            ]
            Cookies do
              Forward "none"
            end
            QueryString true
          end
          PathPattern "/wp-includes/*"
          SmoothStreaming false
          AllowedMethods [
            "HEAD",
            "GET"
          ]
          CachedMethods [
              "HEAD",
              "GET"
          ]
          MinTTL "43200"
        },
        _{
          TargetOriginId do
            Ref "AWS::StackName"
          end
          ViewerProtocolPolicy "allow-all"
          ForwardedValues do
            Headers [
              "Host"
            ]
            Cookies do
              Forward "none"
            end
            QueryString true
          end
          PathPattern "/wp-content/*"
          SmoothStreaming false
          AllowedMethods [
            "HEAD",
            "GET"
          ]
          CachedMethods [
              "HEAD",
              "GET"
          ]
          MinTTL "43200"
        }
      ]
    end
  end
end

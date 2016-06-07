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
      PriceClass "PriceClass_All"
      Enabled true
      Comment "Created by AMIMOTO CloudFormation."
      DefaultRootObject ""
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
            "Authorization",
            "CloudFront-Forwarded-Proto",
            "CloudFront-Is-Desktop-Viewer",
            "CloudFront-Is-Mobile-Viewer",
            "CloudFront-Is-Tablet-Viewer",
            "Host"
          ]
          Cookies do
            Forward "whitelist"
            WhitelistedNames [
              "wordpress_*",
              "wordpress_logged_in_*",
              "wp-postpass_*"
            ]
          end
        end
        ViewerProtocolPolicy "allow-all"
		Compress true
      end
	  #@TODO:CDN流量計測を考えるとここはONにしたほうがいいかも
	  #Logging do
      #    Bucket ""
      #    Prefix ""
      #    IncludeCookies false
	  #end
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
			  "Authorization",
			  "CloudFront-Forwarded-Proto",
			  "CloudFront-Is-Desktop-Viewer",
			  "CloudFront-Is-Mobile-Viewer",
			  "CloudFront-Is-Tablet-Viewer",
			  "Host",
			  "User-Agent",
			  "Referer"
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
		  Compress true
        },
        _{
          TargetOriginId do
            Ref "AWS::StackName"
          end
          ViewerProtocolPolicy "allow-all"
          ForwardedValues do
            Headers [
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
          PathPattern "/wp-admin/*"
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
		  Compress true
        },
        _{
          TargetOriginId do
            Ref "AWS::StackName"
          end
          ViewerProtocolPolicy "allow-all"
          ForwardedValues do
            Headers [
			  "Authorization",
			  "Host"
            ]
            Cookies do
              Forward "none"
            end
            QueryString true
          end
          PathPattern "/wp-content/uploads/*"
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
		  Compress true
        },
        _{
          TargetOriginId do
            Ref "AWS::StackName"
          end
          ViewerProtocolPolicy "allow-all"
          ForwardedValues do
            Headers [
			  "Authorization",
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
		  Compress true
        },
        _{
          TargetOriginId do
            Ref "AWS::StackName"
          end
          ViewerProtocolPolicy "allow-all"
          ForwardedValues do
            Headers [
			  "Authorization",
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
		  Compress true
        }
      ]
    end
  end
end

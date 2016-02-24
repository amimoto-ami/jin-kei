SNSCwAlert do
  Type "AWS::SNS::Topic"
  Properties do
    DisplayName do
        Fn__Join [
          "_",
          [
            _{
              Ref "AWS::StackName"
            },
            "CPU_Alert"
          ]
        ]
    end
    TopicName do
        Fn__Join [
          "_",
          [
            _{
              Ref "AWS::StackName"
            },
            "CPU_Alert"
          ]
        ]
    end
    Subscription [
      _{
        Endpoint do
          Ref "MailAddress"
        end
        Protocol "email"
      }
    ]
  end
end

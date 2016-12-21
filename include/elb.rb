ELB do
  Type "AWS::ElasticLoadBalancing::LoadBalancer"
  DependsOn "AttachGatewayToVPC"
  Properties do
    Subnets [
      _{
        Ref "PublicSubnet"
      }
    ]
    HealthCheck do
      HealthyThreshold   2
      Interval           30
      Target             "TCP:80"
      Timeout            10
      UnhealthyThreshold 2
    end
    if $Stack_Type == 'autoscale' then
      Listeners [
        _{
          InstancePort      80
          LoadBalancerPort  80
          Protocol          "HTTP"
          InstanceProtocol  "HTTP"
        },
        _{
          InstancePort      22
          LoadBalancerPort  22
          Protocol          "TCP"
          InstanceProtocol  "TCP"
        }
      ]
    else
      Listeners [_{
        InstancePort      80
        LoadBalancerPort  80
        Protocol          "HTTP"
        InstanceProtocol  "HTTP"
      }]
    end
    if $Stack_Type != 'autoscale' then
        Instances [
          _{
            Ref "EC2"
          }
        ]
    end
    SecurityGroups [
      _{
        Ref "SecurityGroupInternal"
      },
      _{
        Ref "SecurityGroupPublic"
      }
    ]
  end
end

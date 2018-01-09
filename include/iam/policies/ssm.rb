IAMPolicyForSSM do
  Type "AWS::IAM::ManagedPolicy"
  Properties do
    Description "Allow EC2 System Manager"
    PolicyDocument do
      Version "2012-10-17"
      Statement [
        _{
          Effect "Allow"
          Action [
              "ssm:DescribeAssociation",
              "ssm:GetDeployablePatchSnapshotForInstance",
              "ssm:GetDocument",
              "ssm:GetManifest",
              "ssm:GetParameters",
              "ssm:ListAssociations",
              "ssm:ListInstanceAssociations",
              "ssm:PutInventory",
              "ssm:PutComplianceItems",
              "ssm:PutConfigurePackageResult",
              "ssm:UpdateAssociationStatus",
              "ssm:UpdateInstanceAssociationStatus",
              "ssm:UpdateInstanceInformation"
          ]
          Resource "*"
        },
        _{
          Effect "Allow"
          Action [
              "ec2messages:AcknowledgeMessage",
              "ec2messages:DeleteMessage",
              "ec2messages:FailMessage",
              "ec2messages:GetEndpoint",
              "ec2messages:GetMessages",
              "ec2messages:SendReply"
          ]
          Resource "*"
        },
        _{
          Effect "Allow"
          Action [
              "cloudwatch:PutMetricData"
          ]
          Resource "*"
        },
        _{
          Effect "Allow"
          Action [
              "ec2:DescribeInstanceStatus"
          ]
          Resource "*"
        },
        _{
          Effect "Allow"
          Action [
              "ds:CreateComputer",
              "ds:DescribeDirectories"
          ]
          Resource "*"
        },
        _{
          Effect "Allow"
          Action [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:DescribeLogGroups",
              "logs:DescribeLogStreams",
              "logs:PutLogEvents"
          ]
          Resource "*"
        },
        _{
          Effect "Allow"
          Action [
              "s3:PutObject",
              "s3:GetObject",
              "s3:AbortMultipartUpload",
              "s3:ListMultipartUploadParts",
              "s3:ListBucket",
              "s3:ListBucketMultipartUploads"
          ]
          Resource "*"
        }
      ]
    end
  end
end

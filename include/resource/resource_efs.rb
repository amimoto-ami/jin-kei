Resources do
  _include "include/ec2/ec2-with-rds.rb"
  _include "include/rds/rds.rb"
  _include "include/resource/efs/efs.rb"
  _include "include/resource/efs/efs_mount.rb"
  _include "include/resource/efs/security_group.rb"

  _include "include/resource/autoscale/launch_config.rb"
  _include "include/resource/autoscale/scaling_group.rb"
  _include "include/resource/autoscale/scaling_policy.rb"
  _include "include/resource/cloudwatch/autoscaling.rb"
  _include "include/resource/sns/autoscaling.rb"

  _include "include/001-base-resource.rb"
end

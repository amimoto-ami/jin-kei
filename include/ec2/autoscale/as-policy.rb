AutoScaleUpPolicy do
  Type "AWS::AutoScaling::ScalingPolicy"
  Properties do
    AdjustmentType "ChangeInCapacity"
    AutoScalingGroupName do
      Ref "AutoScalingGroup"
    end
    Cooldown "600"
    ScalingAdjustment "1"
  end
end

AutoScaleDownPolicy do
  Type "AWS::AutoScaling::ScalingPolicy"
  Properties do
    AdjustmentType "ChangeInCapacity"
    AutoScalingGroupName do
      Ref "AutoScalingGroup"
    end
    Cooldown "600"
    ScalingAdjustment "-1"
  end
end

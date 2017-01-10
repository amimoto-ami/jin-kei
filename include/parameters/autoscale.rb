AutoScalingMaxSize do
  Description "Max instance number of AutoScaling group"
  Type        "Number"
  Default     2
end

AutoScalingMinSize do
  Description "Min instance number of AutoScaling group"
  Type        "Number"
  Default     1
end

AutoScalingDesiredCapacity do
  Description "Desired capacity of AutoScaling group"
  Type        "Number"
  Default     1
end

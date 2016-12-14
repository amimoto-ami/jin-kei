Outputs do
  if $Stack_Type != 'autoscale' then
    _include "outputs/ec2.rb"
  end
  _include "outputs/cloudfront.rb"
  _include "outputs/s3.rb"
end

Outputs do
  if $Stack_Type != 'autoscale' then
    _include "outputs/ec2.rb"
  else
    ELBDomain do
        Description "Instance ID required for first login. Please make a note of this value."
        Value do
            Fn__GetAtt "ELB", "DNSName"
        end
    end
  end
  _include "outputs/cloudfront.rb"
  _include "outputs/s3.rb"
end

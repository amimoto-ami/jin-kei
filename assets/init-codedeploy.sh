#/bin/bash
cd /tmp
AZ=`/usr/bin/curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed -e 's/.$//g'`
BUCKET="https://aws-codedeploy-${AZ}.s3.amazonaws.com/latest/install"
wget $BUCKET
chmod +x ./install
./install auto
service codedeploy-agent restart

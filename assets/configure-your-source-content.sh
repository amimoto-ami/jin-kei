#/bin/bash

# 事前にユーザーでやること
# cd /PATH/TO/WORDPRESS
# git init
# git add .
# git commit -m "add All WordPress Source Code"

if [ "${1}" = "" ]; then
	echo "Please Set Your Git Repository Address \n"
	echo "Example. \n"
	echo "/bin/bash/ configure-your-source-content.sh git@github.com:YOUR_GITHUB_ACCOUNT/WordPress.git"
	exit 1
fi

git remote add deploy ${1}
mkdir -p CodeDeploy-Scripts

cat << EOS > CodeDeploy-Scripts/install_dependencies.sh
#!/bin/bash
yum groupinstall -y "Web Server" "MySQL Database" "PHP Support"
yum install -y php-mysql
EOS

cat << EOS > CodeDeploy-Scripts/stop_server.sh
#!/bin/bash
isExistApp=`pgrep nginx`
if [[ -n  \$isExistApp ]]; then
   service nginx stop
fi
isExistApp=`pgrep mysql`
if [[ -n  \$isExistApp ]]; then
    service mysql stop
fi
EOS

cat << EOS > CodeDeploy-Scripts/start_server.sh
#!/bin/bash
service nginx start
service mysql start
EOS

cat << EOS > CodeDeploy-Scripts/change_permissions.sh
#!/bin/bash
chmod -R 755 /var/www/html/
EOS

chmod +x CodeDeploy-Scripts/*

cat << EOS > appspec.yml
version: 0.0
os: linux
files:
  - source: /
    destination: /var/www/html/
hooks:
  BeforeInstall:
    - location: CodeDeploy-Scripts/install_dependencies.sh
      timeout: 300
      runas: root
  AfterInstall:
    - location: CodeDeploy-Scripts/change_permissions.sh
      timeout: 300
      runas: root
  ApplicationStart:
    - location: CodeDeploy-Scripts/start_server.sh
      timeout: 300
      runas: root
  ApplicationStop:
    - location: CodeDeploy-Scripts/stop_server.sh
      timeout: 300
      runas: root
EOS

git add .
git commit -m "add CodeDeploy Scripts."
git push deploy master

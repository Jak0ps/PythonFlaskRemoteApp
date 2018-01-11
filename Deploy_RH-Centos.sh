#!/usr/bin/env bash
#sudo su
if [ ! $(whoami) = jsaleh ]
    then
        echo "Run this script as root only"
        exit
fi
###################
yum install git -y && yum install wget -y
wget -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && python /tmp/get-pip.py
pip install flask && pip install pymongo && pip install fabric

cat << EOF > /etc/yum.repos.d/mongodb-org-3.6.repo
[mongodb-org-3.6]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.6/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.6.asc
EOF

yum install mongodb-org -y
service mongod start
#chkconfig mongod on

mkdir -p /opt/myapp
cd /opt/myapp
#git init
#Clone your repo
git clone https://github.com/Jak0ps/PythonFlaskRemoteApp.git

git config --global user.email "jsaleh@test.com"
git config --global user.name "Jacob"

#chmod +x /opt/myapp/*.py* && chmod +x /opt/myapp/*.sh
chown -R jsaleh:jsaleh /opt/myapp/

#Create Daemon
cat <<EOF > /lib/systemd/system/myapp.service
[Unit]
Description=myapp Server
After=network.target

[Service]
User=jsaleh
WorkingDirectory=/opt/myapp/PythonFlaskRemoteApp
ExecStart=/opt/myapp/PythonFlaskRemoteApp/app.py
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

systemctl enable myapp
systemctl start myapp

#ps -ef | grep app.py | head -n 1 | awk '{print $2}'

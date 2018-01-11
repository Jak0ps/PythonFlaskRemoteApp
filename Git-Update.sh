#!/usr/bin/env bash
#sudo su
if [ ! $(whoami) = root ]
    then
        echo "Run this script as root only"
        exit
fi

cd /opt/myapp
git pull https://github.com/Jak0ps/PythonFlaskRemoteApp.git
systemctl restart myapp

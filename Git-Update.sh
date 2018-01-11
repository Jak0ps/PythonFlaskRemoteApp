#!/usr/bin/env bash
#sudo su
if [ ! $(whoami) = jsaleh ]
    then
        echo "Run this script as root only"
        exit
fi

cd /opt/myapp
git pull https://github.com/Jak0ps/PythonFlaskRemoteApp.git
systemctl restart myapp

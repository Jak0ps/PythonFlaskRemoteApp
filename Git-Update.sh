#!/usr/bin/env bash
#sudo su
if [ ! $(whoami) = jsaleh ]
    then
        echo "Run this script as jsaleh only"
        exit
fi

cd /opt/myapp/PythonFlaskRemoteApp
git pull https://github.com/Jak0ps/PythonFlaskRemoteApp.git
sudo systemctl restart myapp
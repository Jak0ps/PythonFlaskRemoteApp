#!/usr/bin/env bash
#sudo su
APPUSER="jsaleh"
if [ ! $(whoami) = $APPUSER ]
    then
        echo "Run this script as "$APPUSER"= only"
        exit
fi

cd /opt/myapp/PythonFlaskRemoteApp
git pull https://github.com/Jak0ps/PythonFlaskRemoteApp.git
sudo systemctl restart myapp
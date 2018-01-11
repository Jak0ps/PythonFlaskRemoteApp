#!/usr/bin/env bash

sudo su
cd /opt/myapp
git pull https://github.com/Jak0ps/PythonFlaskRemoteApp.git
systemctl restart myapp
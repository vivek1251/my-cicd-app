#!/bin/bash
cd /home/ec2-user/app
nohup node src/index.js > /var/log/myapp.log 2>&1 &
echo Application started!
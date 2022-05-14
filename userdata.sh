#!/bin/bash
su - ec2-user

# SCN Download
aws s3 cp s3://klaytn-node-config/ /home/ec2-user/ --recursive
chmod +x ~/kscn-linux-amd64/bin/kscn*

# Add PATH
sed -i -e "/^PATH/ s/$/\:\$HOME\/homi-linux-amd64\/bin\:\$HOME\/kscn-linux-amd64\/bin/" .bash_profile

# source 
source ~/.bash_profile



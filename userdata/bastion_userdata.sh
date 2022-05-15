#!/bin/bash

# Set localtime
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

aws s3 cp s3://${s3_bucket_path}/key/ /home/ec2-user/ --recursive
chown ec2-user:ec2-user /home/ec2-user/*.pem
chmod 400 /home/ec2-user/*.pem